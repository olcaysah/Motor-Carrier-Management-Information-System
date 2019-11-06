CREATE TABLE public.data_table
(
    id serial,
    dot_number integer,
    legal_name character varying,
    dba_name character varying,
    carrier_operation character varying,
    hm_flag character varying,
    pc_flag character varying,
    phy_street character varying,
    phy_city character varying,
    phy_state character varying,
    phy_zip character varying,
    phy_country character varying,
    mailing_street character varying,
    mailing_city character varying,
    mailing_state character varying,
    mailing_zip character varying,
    mailing_country character varying,
    telephone character varying,
    fax character varying,
    email_address character varying,
    mcs150_date character varying,
    mcs150_mileage character varying,
    mcs150_mileage_year character varying,
    add_date character varying,
    oic_state character varying,
    nbr_power_unit character varying,
    driver_total character varying
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

CREATE INDEX index_abrv
    ON public.data_table USING btree
    (phy_state COLLATE pg_catalog."C" varchar_ops)
    TABLESPACE pg_default;