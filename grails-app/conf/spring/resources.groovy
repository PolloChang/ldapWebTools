import ldap.LdapService

// Place your Spring DSL code here
beans = {
    // LDAP 連線池
    ldapService(LdapService)
}
