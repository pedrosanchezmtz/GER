SELECT
    hp.jgzz_fiscal_code rfc,
    hp.party_name,
    hp.party_number,
    hp.party_id,
    hca.account_number,
    hca.cust_account_id,
    hcas.cust_acct_site_id,
    hps.party_site_number,
    hcsu.site_use_id,
    hcsu.site_use_code,
    hcsu.primary_flag,
    hcsu.location,
    hl.location_id,
    tb.name payment_terms,
    hao.organization_id,
    hao.name
FROM
    hz_cust_accounts hca,
    hz_parties hp,
    hz_cust_acct_sites_all hcas,
    hz_cust_site_uses_all hcsu,
    hz_party_sites hps,
    hz_locations hl,
    hz_customer_profiles_f pf,
    fnd_setid_assignments fsa,
    hr_all_organization_units hao,
    ra_terms_tl tb
WHERE 1 = 1
    AND hca.party_id = hp.party_id
    AND hca.cust_account_id = hcas.cust_account_id
    AND hcsu.cust_acct_site_id = hcas.cust_acct_site_id
    AND hps.party_site_id = hcas.party_site_id
    AND hps.location_id = hl.location_id
    AND pf.cust_account_id = hca.cust_account_id
	AND hp.status = 'A'
    AND tb.term_id(+) = pf.standard_terms
    AND tb.language(+) = userenv('LANG')
    AND hcas.set_id = fsa.set_id
    AND hao.organization_id = fsa.determinant_value
    AND fsa.reference_group_name = 'HZ_CUSTOMER_ACCOUNT_SITE'
    AND fsa."DETERMINANT_TYPE" = 'BU'
	AND TO_DATE(hcas.END_DATE) = '4712-12-31' ---QUITA LOS SITIOS NO ACTIVOS EN LA UN
    AND hp.jgzz_fiscal_code IN (:p_rfc)