############################################################
#
# template global_variables
#
# This template defines some standard global variables such
# as the host name, domain name, etc.  This template should
# be customized for your site.
#
# This template is one of the first template included: thus
# default values defined here cannot be redefined in cluster/site
# specific templates using ?=. Use = instead.
#
############################################################

unique template site/global_variables;

include { 'pan/functions' };

final variable DEFAULT_DOMAIN = "example.org";

final variable HOSTNAME = hostname_from_object();
final variable DOMAIN = domain_from_object(DEFAULT_DOMAIN);
final variable FULL_HOSTNAME= full_hostname_from_object(DEFAULT_DOMAIN);

# Define the nameservers to use for the site. 
final variable NAMESERVERS = list("134.158.120.3");

# Define the network parameters for the site.  The IP
# information is taken from the DB_IP "database". The
# full hostname is the key for that nlist.
variable NETWORK_PARAMS = nlist("ip",DB_IP[escape(FULL_HOSTNAME)],
                                       "gateway","134.158.88.1",
                                       "broadcast","134.158.95.255",
                                       "netmask","255.255.248.0");


#
# YUM related variables
#
variable YUM_SNAPSHOT_ROOT_URL ?= 'http://vmrepo.lal.in2p3.fr/yum/snapshots';


# AII site specific configuration
variable AII_CONFIG_SITE ?= 'site/aii-config';
