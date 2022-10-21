require 'spec_helper'

describe 'fluent_bit_config' do

    configs = { 
        "output-smx3" => { 
            "service" => "smx3", 
            "name" => "file",
            "format" => "template",
            "template" => "{log}",
            "match" => "smx3",
            "path" => "/var/smx/logs/smx3/portal/",
            "mkdir" => "true",
            "file" => "karaf.log",
        } 
    }

    it { is_expected.to run.with_params(configs) }
end