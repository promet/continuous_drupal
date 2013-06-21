name             "continuous_drupal"
maintainer       "Will Milton"
maintainer_email "will@promethost.com"
license          "Apache 2.0"
description      "Installs/Configures continuous_drupal"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends 'drupal'
depends 'jenkins'
depends 'git'
