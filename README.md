## Warning: This has not been tested. Do not use

This docker image runs curator tasks against an elasticsearch cluster to manage its indices.

The list of tasks currently are:
* purge old logstash indices (when MAX_INDEX_AGE is set)
* optimise logstash indices that are more than 1 day old

## Configuration

`ELASTICSEARCH_HOST` - The hostname or IP address of the elasticsearch instance.
`ELASTICSEARCH_PORT` - The port the elasticsearch instance.
`MAX_INDEX_AGE` - The maximum age (in days) a logstash index can be until it is deleted.
