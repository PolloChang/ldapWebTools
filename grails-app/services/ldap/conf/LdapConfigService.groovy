package ldap.conf

import grails.core.GrailsApplication
import grails.gorm.transactions.Transactional

/**
 * 取得 LDAP 設定
 */
@Transactional
class LdapConfigService {

    GrailsApplication grailsApplication

    private String server

    private String bindDb

    private String cred

    private int port

    private String baseDN

    private String peopleDN

    String getServer(){
        server = grailsApplication.config.apache.directory.ldap.server
        return server
    }

    String getBindDb(){
        bindDb = grailsApplication.config.apache.directory.ldap.bindDb
        return bindDb
    }

    String getCred(){
        cred = grailsApplication.config.apache.directory.ldap.cred
        return cred
    }

    int getPort(){
        port = grailsApplication.config.apache.directory.ldap.port
        return port
    }

    String getBaseDN(){
        baseDN = grailsApplication.config.apache.directory.ldap.baseDN
        return baseDN
    }

    String getPeopleDN(){
        peopleDN = grailsApplication.config.apache.directory.ldap.peopleDN
        return peopleDN
    }
}
