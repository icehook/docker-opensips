FROM icehook/unbound:0.1

MAINTAINER IceHook Systems

ENV OPENSIPS_VERSION 2.2.3

RUN yum install -y http://yum.opensips.org/2.2/releases/el/6/x86_64/opensips-yum-releases-2.2-3.el6.noarch.rpm

RUN yum -y update

RUN yum install -y hiredis-devel libconfuse-devel freeradius-client-devel librabbitmq-devel GeoIP-devel radiusclient-ng-devel perl-RPC-XML perl-Frontier-RPC

RUN yum install --disablerepo=epel --nogpgcheck -y \
  opensips-clusterer \
  opensips-db_mysql \
  opensips-db_postgresql \
  opensips-debuginfo \
  opensips-jabber \
  opensips-mysql \
  opensips-perl \
  opensips-pi_http \
  opensips-postgresql \
  opensips-proto_bin \
  opensips-rest_client \
  opensips-snmpstats \
  opensips-tlsops \
  opensips-unixodbc \
  opensips-xmpp \
  opensips \
  opensips-aaa_radius \
  opensips-acc \
  opensips-auth_aaa \
  opensips-auth_diameter \
  opensips-b2bua \
  opensips-carrierroute \
  opensips-compression \
  opensips-cpl-c \
  opensips-cpl_c \
  opensips-db_berkeley \
  opensips-db_http \
  opensips-db_perlvdb \
  opensips-db_sqlite \
  opensips-emergency \
  opensips-event_datagram \
  opensips-event_flatstore \
  opensips-event_rabbitmq \
  opensips-event_route \
  opensips-event_virtual \
  opensips-event_xmlrpc \
  opensips-fraud_detection \
  opensips-h350 \
  opensips-httpd \
  opensips-json \
  opensips-ldap \
  opensips-memcached \
  opensips-mmgeoip \
  opensips-peering \
  opensips-perlvdb \
  opensips-presence \
  opensips-presence_callinfo \
  opensips-presence_dialoginfo \
  opensips-presence_mwi \
  opensips-presence_xcapdiff \
  opensips-presence_xml \
  opensips-proto_hep \
  opensips-proto_sctp \
  opensips-proto_tls \
  opensips-proto_ws \
  opensips-proto_wss \
  opensips-pua \
  opensips-pua_bla \
  opensips-pua_dialoginfo \
  opensips-pua_mi \
  opensips-pua_usrloc \
  opensips-pua_xmpp \
  opensips-python \
  opensips-redis \
  opensips-regex \
  opensips-rls \
  opensips-rtpengine \
  opensips-seas \
  opensips-sms \
  opensips-sql_cacher \
  opensips-tls_mgm \
  opensips-topology_hiding \
  opensips-xcap \
  opensips-xcap_client \
  opensips-xmlrpc \
  opensips-xmlrpc_ng

COPY ./conf/23-opensips.conf /etc/rsyslog.d/23-opensips.conf

ADD bootstrap.sh /bootstrap.sh
RUN chown root:root /bootstrap.sh && chmod 700 /bootstrap.sh
ENV BOOTSTRAP /bootstrap.sh

EXPOSE 5060
EXPOSE 5060/udp

CMD ["/bootstrap.sh"]
