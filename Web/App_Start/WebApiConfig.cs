﻿using Goody.Web.App_Start;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.Net.Http.Formatting;
using System.Web.Http;

namespace Goody.Web
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            JsonMediaTypeFormatter jsonFormatter = new JsonMediaTypeFormatter();
            //optional: set serializer settings here
            config.Services.Replace(typeof(IContentNegotiator), new JsonContentNegotiator(jsonFormatter));

            MediaTypeFormatterCollection formatters = config.Formatters;
            JsonMediaTypeFormatter jFormatter = formatters.JsonFormatter;
            JsonSerializerSettings settings = jsonFormatter.SerializerSettings;
            // settings.Formatting = Formatting.Indented;
            settings.ContractResolver = new CamelCasePropertyNamesContractResolver();
        }
    }
}
