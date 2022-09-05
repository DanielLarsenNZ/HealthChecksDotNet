﻿namespace HealthChecksCommon
{
    public static class Constants
    {
        public const string RedisConnectionString = "REDIS_CONNECTION_STRING";
        public const string AzureServiceBusConnectionString = "AZURE_SERVICE_BUS_CONNECTION_STRING";
        public const string AzureServiceBusQueueName = "AZURE_SERVICE_BUS_QUEUE_NAME";
        public const string AzureCosmosDbConnectionString = "AZURE_COSMOSDB_CONNECTION_STRING";
        public const string AzureCosmosDbDatabaseName = "AZURE_COSMOSDB_DATABASE_NAME";
        public const string AzureKeyVaultUri = "AZURE_KEYVAULT_URI";
        public const string AzureStorageConnectionString = "AZURE_STORAGE_CONNECTION_STRING";
        public const string AzureStorageContainerName = "AZURE_STORAGE_CONTAINER_NAME";
        public const string SqlServerConnectionString = "SQL_SERVER_CONNECTION_STRING";

        public const string HttpsEndpointUrls = "HTTPS_ENDPOINT_URLS";
        public const string EchoAllowedHosts = "ECHO_ALLOWED_HOSTS";

        public const int DefaultTimeoutSeconds = 2;
    }
}