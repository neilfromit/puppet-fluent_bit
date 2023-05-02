# Fluent-bit

Install, configure, and manage Fluent-bit log shipper.
This module is heavily inspired from https://github.com/soylent/konstantin-fluentd/

## Module Description

 * Installs td-agent package
 * Generates configuration file td-agent-bit.conf
 * Manages td-agent-bit service

## Usage Examples

### Basic

Install and start the service.

```puppet
class { 'fluent-bit': }
```

### Hiera Support

Defining Fluentd resources in Hiera.

```yaml
fluent_bit::configs:
  'my_cpu':
    service: 'INPUT'
    name: 'cpu'
    tag: 'tag1'

# optional custom parsers configuration
fluent_bit::parsers:
  parser_01:
    service: 'PARSER'
    name: 'parser_01'
    format: 'regex'
    regex: '^(?<time>[^ ]*) (?<message>[^$]*)$'
    time_key: 'time'
    time_format: '%Y-%m-%dT%H:%M:%S,%L'
```

## Limitations

Tested on Ubuntu 16.04


## Development

Bug reports and pull requests are welcome!
