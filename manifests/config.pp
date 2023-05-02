class fluent_bit::config inherits fluent_bit {

  file { $fluent_bit::config_path:
    ensure  => directory,
    owner   => $fluent_bit::config_owner,
    group   => $fluent_bit::config_group,
    mode    => '0750',
    recurse => true,
    force   => true,
    purge   => true,
  } ->

  file { "${fluent_bit::config_file}":
    ensure  => present,
    content => fluent_bit_config($fluent_bit::configs),
    require => Class['Fluent_bit::Install'],
    notify  => Class['Fluent_bit::Service'],
  }

  if ( $fluent_bit::custom_parsers != {} ) {
    file { $fluent_bit::custom_parsers_file:
      ensure  => present,
      content => fluent_bit_config($fluent_bit::custom_parsers),
      owner   => $fluent_bit::config_owner,
      group   => $fluent_bit::config_group,
      mode    => '0644',
      require => File[$fluent_bit::config_file],
      notify  => Class['Fluent_bit::Service'],
    }
  } else {
      file { $fluent_bit::custom_parsers_file:
      ensure => absent,
      notify => Class['Fluent_bit::Service'],
    }
  }

}
