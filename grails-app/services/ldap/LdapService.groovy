package ldap

import grails.util.Holders
import org.apache.commons.pool2.impl.GenericObjectPoolConfig
import org.apache.directory.api.ldap.model.exception.LdapException
import org.apache.directory.ldap.client.api.DefaultLdapConnectionFactory
import org.apache.directory.ldap.client.api.DefaultPoolableLdapConnectionFactory
import org.apache.directory.ldap.client.api.LdapConnection
import org.apache.directory.ldap.client.api.LdapConnectionConfig
import org.apache.directory.ldap.client.api.LdapConnectionPool
import org.apache.directory.ldap.client.api.LdapNetworkConnection

import java.time.Duration

/**
 * LDAP 服務
 * 參考資料
 * [LDAP Pooled Connection from Apache Java Library - Do We Need to unbind](https://stackoverflow.com/questions/64392111/ldap-pooled-connection-from-apache-java-library-do-we-need-to-)
 * [Connection and disconnection](https://directory.apache.org/api/user-guide/2.1-connection-disconnection.html)
 */
class LdapService implements Closeable {
    private LdapConnectionConfig config
    private DefaultLdapConnectionFactory factory
    private GenericObjectPoolConfig poolConfig
    private final LdapConnectionPool pool
    private final LdapConnection connection

    LdapService(){
        setConfig()
        setPoolConfig()
        connection = new LdapNetworkConnection(config)
        pool = new LdapConnectionPool(new DefaultPoolableLdapConnectionFactory( factory ), poolConfig)
    }

    private void setConfig() {
        String hostname = Holders.getGrailsApplication().config.apache.directory.ldap.hostname
        int port = Holders.getGrailsApplication().config.apache.directory.ldap.port
        String adminDn = Holders.getGrailsApplication().config.apache.directory.ldap.adminDn
        String adminPassword = Holders.getGrailsApplication().config.apache.directory.ldap.adminPassword

        config = new LdapConnectionConfig()
        config.setLdapHost( hostname )
        config.setLdapPort( port )
        config.setName( adminDn )
        config.setCredentials( adminPassword )
    }

    private void setPoolConfig(){
        poolConfig = new GenericObjectPoolConfig()
        poolConfig.lifo = true
        poolConfig.maxIdle = 8
        poolConfig.maxWait = Duration.ofMillis(-1L)
        poolConfig.minEvictableIdleTimeMillis = 1000L * 60L * 30L
        poolConfig.minIdle = 0
        poolConfig.numTestsPerEvictionRun = 3
        poolConfig.softMinEvictableIdleTimeMillis = -1L
        poolConfig.testOnBorrow = false
        poolConfig.testOnReturn = false
        poolConfig.testWhileIdle = false
        poolConfig.timeBetweenEvictionRunsMillis = -1L
    }

    /**
     * 取得連線
     * @return
     */
    LdapConnection getConnection(){
        return connection
    }

    @Override
    void close() throws IOException {
        if (pool != null) {
            try {
                pool.releaseConnection(connection)
            } catch (final LdapException e) {
                throw new IOException(e.getMessage(), e)
            } catch(IllegalStateException e){
                log.error(e)
            }
        }
    }
}
