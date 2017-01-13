CREATE TABLE g_object (
    g_name character varying(1024) NOT NULL,
    g_association character varying(5) DEFAULT 'False',
    g_parent character varying(1024),
    g_child character varying(1024),
    g_description character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE INDEX g_object_name_idx ON g_object (g_name);
CREATE INDEX g_object_deleted_idx ON g_object (g_deleted);
CREATE INDEX g_object_txnid_idx ON g_object (g_transaction_id);

CREATE TABLE g_object_log (
    g_name character varying(1024) NOT NULL,
    g_association character varying(5) DEFAULT 'False',
    g_parent character varying(1024),
    g_child character varying(1024),
    g_description character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE TABLE g_attribute (
    g_object character varying(1024) NOT NULL,
    g_name character varying(1024) NOT NULL,
    g_data_type character varying(1024),
    g_primary_key character varying(5) DEFAULT 'False',
    g_required character varying(5) DEFAULT 'False',
    g_fixed character varying(5) DEFAULT 'False',
    g_values character varying(1024),
    g_default_value character varying(1024),
    g_sequence integer,
    g_hidden character varying(5) DEFAULT 'False',
    g_description character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE INDEX g_attribute_object_idx ON g_attribute (g_object);
CREATE INDEX g_attribute_name_idx ON g_attribute (g_name);
CREATE INDEX g_attribute_deleted_idx ON g_attribute (g_deleted);
CREATE INDEX g_attribute_txnid_idx ON g_attribute (g_transaction_id);

CREATE TABLE g_attribute_log (
    g_object character varying(1024) NOT NULL,
    g_name character varying(1024) NOT NULL,
    g_data_type character varying(1024),
    g_primary_key character varying(5) DEFAULT 'False',
    g_required character varying(5) DEFAULT 'False',
    g_fixed character varying(5) DEFAULT 'False',
    g_values character varying(1024),
    g_default_value character varying(1024),
    g_sequence integer,
    g_hidden character varying(5) DEFAULT 'False',
    g_description character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE TABLE g_action (
    g_object character varying(1024) NOT NULL,
    g_name character varying(1024) NOT NULL,
    g_display character varying(5) DEFAULT 'False',
    g_description character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE INDEX g_action_object_idx ON g_action (g_object);
CREATE INDEX g_action_name_idx ON g_action (g_name);
CREATE INDEX g_action_deleted_idx ON g_action (g_deleted);
CREATE INDEX g_action_txnid_idx ON g_action (g_transaction_id);

CREATE TABLE g_action_log (
    g_object character varying(1024) NOT NULL,
    g_name character varying(1024) NOT NULL,
    g_display character varying(5) DEFAULT 'False',
    g_description character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE TABLE g_transaction (
    g_id integer NOT NULL,
    g_object character varying(1024) NOT NULL,
    g_action character varying(1024) NOT NULL,
    g_actor character varying(1024) NOT NULL,
    g_name character varying(1024),
    g_child character varying(1024),
    g_count integer,
    g_details character varying(1024),
    g_description character varying(1024),
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_project character varying(1024),
    g_user character varying(1024),
    g_machine character varying(1024),
    g_job_id character varying(1024),
    g_amount double precision,
    g_delta double precision,
    g_account integer,
    g_allocation integer
);

CREATE INDEX g_transaction_id_idx ON g_transaction (g_id);
CREATE INDEX g_transaction_created_idx ON g_transaction (g_creation_time);
CREATE INDEX g_transaction_account_idx ON g_transaction (g_account);
CREATE INDEX g_transaction_delta_idx ON g_transaction (g_delta);
CREATE INDEX g_transaction_deleted_idx ON g_transaction (g_deleted);
CREATE INDEX g_transaction_txnid_idx ON g_transaction (g_transaction_id);

CREATE TABLE g_transaction_log (
    g_id integer NOT NULL,
    g_object character varying(1024) NOT NULL,
    g_action character varying(1024) NOT NULL,
    g_actor character varying(1024) NOT NULL,
    g_name character varying(1024),
    g_child character varying(1024),
    g_count integer,
    g_details character varying(1024),
    g_description character varying(1024),
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_project character varying(1024),
    g_user character varying(1024),
    g_machine character varying(1024),
    g_job_id character varying(1024),
    g_amount double precision,
    g_delta double precision,
    g_account integer,
    g_allocation integer
);

CREATE TABLE g_system (
    g_name character varying(1024) NOT NULL,
    g_version character varying(1024) NOT NULL,
    g_description character varying(1024),
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_organization character varying(1024)
);

CREATE INDEX g_system_name_idx ON g_system (g_name);
CREATE INDEX g_system_deleted_idx ON g_system (g_deleted);
CREATE INDEX g_system_txnid_idx ON g_system (g_transaction_id);

CREATE TABLE g_system_log (
    g_name character varying(1024) NOT NULL,
    g_version character varying(1024) NOT NULL,
    g_description character varying(1024),
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_organization character varying(1024)
);

CREATE TABLE g_user (
    g_name character varying(1024) NOT NULL,
    g_description character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_active character varying(5) DEFAULT 'True',
    g_common_name character varying(1024),
    g_phone_number character varying(1024),
    g_email_address character varying(1024),
    g_default_project character varying(1024),
    g_organization character varying(1024)
);

CREATE INDEX g_user_name_idx ON g_user (g_name);
CREATE INDEX g_user_deleted_idx ON g_user (g_deleted);
CREATE INDEX g_user_txnid_idx ON g_user (g_transaction_id);

CREATE TABLE g_user_log (
    g_name character varying(1024) NOT NULL,
    g_description character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_active character varying(5) DEFAULT 'True',
    g_common_name character varying(1024),
    g_phone_number character varying(1024),
    g_email_address character varying(1024),
    g_default_project character varying(1024),
    g_organization character varying(1024)
);

CREATE TABLE g_role (
    g_name character varying(1024) NOT NULL,
    g_description character varying(1024),
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE INDEX g_role_name_idx ON g_role (g_name);
CREATE INDEX g_role_deleted_idx ON g_role (g_deleted);
CREATE INDEX g_role_txnid_idx ON g_role (g_transaction_id);

CREATE TABLE g_role_log (
    g_name character varying(1024) NOT NULL,
    g_description character varying(1024),
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE TABLE g_role_action (
    g_role character varying(1024) NOT NULL,
    g_object character varying(1024) NOT NULL,
    g_name character varying(1024) NOT NULL,
    g_instance character varying(1024) NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE INDEX g_role_action_role_idx ON g_role_action (g_role);
CREATE INDEX g_role_action_name_idx ON g_role_action (g_name);
CREATE INDEX g_role_action_deleted_idx ON g_role_action (g_deleted);
CREATE INDEX g_role_action_txnid_idx ON g_role_action (g_transaction_id);

CREATE TABLE g_role_action_log (
    g_role character varying(1024) NOT NULL,
    g_object character varying(1024) NOT NULL,
    g_name character varying(1024) NOT NULL,
    g_instance character varying(1024) NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE TABLE g_role_user (
    g_role character varying(1024) NOT NULL,
    g_name character varying(1024) NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE INDEX g_role_user_role_idx ON g_role_user (g_role);
CREATE INDEX g_role_user_name_idx ON g_role_user (g_name);
CREATE INDEX g_role_user_deleted_idx ON g_role_user (g_deleted);
CREATE INDEX g_role_user_txnid_idx ON g_role_user (g_transaction_id);

CREATE TABLE g_role_user_log (
    g_role character varying(1024) NOT NULL,
    g_name character varying(1024) NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE TABLE g_password (
    g_user character varying(1024) NOT NULL,
    g_password character varying(1024),
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE INDEX g_password_user_idx ON g_password (g_user);
CREATE INDEX g_password_deleted_idx ON g_password (g_deleted);
CREATE INDEX g_password_txnid_idx ON g_password (g_transaction_id);

CREATE TABLE g_password_log (
    g_user character varying(1024) NOT NULL,
    g_password character varying(1024),
    g_deleted character varying(5) DEFAULT 'False',
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL
);

CREATE TABLE g_key_generator (
    g_name character varying(1024) NOT NULL,
    g_next_id integer NOT NULL
);

CREATE INDEX g_key_generator_name_idx ON g_key_generator (g_name);

CREATE TABLE g_undo (
    g_request_id integer NOT NULL
);

CREATE TABLE g_organization (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_name character varying(1024),
    g_host character varying(1024),
    g_port character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_description character varying(1024)
);

CREATE INDEX g_organization_name_idx ON g_organization (g_name);
CREATE INDEX g_organization_deleted_idx ON g_organization (g_deleted);
CREATE INDEX g_organization_txnid_idx ON g_organization (g_transaction_id);

CREATE TABLE g_organization_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_name character varying(1024),
    g_host character varying(1024),
    g_port character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_description character varying(1024)
);

CREATE TABLE g_project (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_name character varying(1024),
    g_active character varying(5) DEFAULT 'True',
    g_organization character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_description character varying(1024)
);

CREATE INDEX g_project_name_idx ON g_project (g_name);
CREATE INDEX g_project_deleted_idx ON g_project (g_deleted);
CREATE INDEX g_project_txnid_idx ON g_project (g_transaction_id);

CREATE TABLE g_project_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_name character varying(1024),
    g_active character varying(5) DEFAULT 'True',
    g_organization character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_description character varying(1024)
);

CREATE TABLE g_machine (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_name character varying(1024),
    g_active character varying(5) DEFAULT 'True',
    g_architecture character varying(1024),
    g_operating_system character varying(1024),
    g_organization character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_description character varying(1024)
);

CREATE INDEX g_machine_name_idx ON g_machine (g_name);
CREATE INDEX g_machine_deleted_idx ON g_machine (g_deleted);
CREATE INDEX g_machine_txnid_idx ON g_machine (g_transaction_id);

CREATE TABLE g_machine_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_name character varying(1024),
    g_active character varying(5) DEFAULT 'True',
    g_architecture character varying(1024),
    g_operating_system character varying(1024),
    g_organization character varying(1024),
    g_special character varying(5) DEFAULT 'False',
    g_description character varying(1024)
);

CREATE TABLE g_project_user (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_project character varying(1024),
    g_name character varying(1024),
    g_active character varying(5) DEFAULT 'True',
    g_admin character varying(5) DEFAULT 'False'
);

CREATE INDEX g_project_user_project_idx ON g_project_user (g_project);
CREATE INDEX g_project_user_name_idx ON g_project_user (g_name);
CREATE INDEX g_project_user_deleted_idx ON g_project_user (g_deleted);
CREATE INDEX g_project_user_txnid_idx ON g_project_user (g_transaction_id);

CREATE TABLE g_project_user_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_project character varying(1024),
    g_name character varying(1024),
    g_active character varying(5) DEFAULT 'True',
    g_admin character varying(5) DEFAULT 'False'
);

CREATE TABLE g_project_machine (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_project character varying(1024),
    g_name character varying(1024),
    g_active character varying(5) DEFAULT 'True'
);

CREATE INDEX g_project_machine_project ON g_project_machine (g_project);
CREATE INDEX g_project_machine_name_idx ON g_project_machine (g_name);
CREATE INDEX g_project_machine_deleted_idx ON g_project_machine (g_deleted);
CREATE INDEX g_project_machine_txnid_idx ON g_project_machine (g_transaction_id);

CREATE TABLE g_project_machine_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_project character varying(1024),
    g_name character varying(1024),
    g_active character varying(5) DEFAULT 'True'
);

CREATE TABLE g_account (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_id integer,
    g_name character varying(1024),
    g_description character varying(1024)
);

CREATE INDEX g_account_id_idx ON g_account (g_id);
CREATE INDEX g_account_deleted_idx ON g_account (g_deleted);
CREATE INDEX g_account_txnid_idx ON g_account (g_transaction_id);

CREATE TABLE g_account_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_id integer,
    g_name character varying(1024),
    g_description character varying(1024)
);

CREATE TABLE g_account_project (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_account integer,
    g_name character varying(1024),
    g_access character varying(5) DEFAULT 'True'
);

CREATE INDEX g_account_project_account_idx ON g_account_project (g_account);
CREATE INDEX g_account_project_name_idx ON g_account_project (g_name);
CREATE INDEX g_account_project_deleted_idx ON g_account_project (g_deleted);
CREATE INDEX g_account_project_txnid_idx ON g_account_project (g_transaction_id);

CREATE TABLE g_account_project_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_account integer,
    g_name character varying(1024),
    g_access character varying(5) DEFAULT 'True'
);

CREATE TABLE g_account_user (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_account integer,
    g_name character varying(1024),
    g_access character varying(5) DEFAULT 'True'
);

CREATE INDEX g_account_user_account_idx ON g_account_user (g_account);
CREATE INDEX g_account_user_name_idx ON g_account_user (g_name);
CREATE INDEX g_account_user_deleted_idx ON g_account_user (g_deleted);
CREATE INDEX g_account_user_txnid_idx ON g_account_user (g_transaction_id);

CREATE TABLE g_account_user_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_account integer,
    g_name character varying(1024),
    g_access character varying(5) DEFAULT 'True'
);

CREATE TABLE g_account_machine (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_account integer,
    g_name character varying(1024),
    g_access character varying(5) DEFAULT 'True'
);

CREATE INDEX g_account_machine_account_idx ON g_account_machine (g_account);
CREATE INDEX g_account_machine_name_idx ON g_account_machine (g_name);
CREATE INDEX g_account_machine_deleted_idx ON g_account_machine (g_deleted);
CREATE INDEX g_account_machine_txnid_idx ON g_account_machine (g_transaction_id);

CREATE TABLE g_account_machine_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_account integer,
    g_name character varying(1024),
    g_access character varying(5) DEFAULT 'True'
);

CREATE TABLE g_account_organization (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_account integer,
    g_name character varying(1024),
    g_user character varying(1024),
    g_project character varying(1024),
    g_machine character varying(1024),
    g_type character varying(1024) DEFAULT 'Forward'
);

CREATE INDEX g_account_organization_account_idx ON g_account_organization (g_account);
CREATE INDEX g_account_organization_name_idx ON g_account_organization (g_name);
CREATE INDEX g_account_organization_deleted_idx ON g_account_organization (g_deleted);
CREATE INDEX g_account_organization_txnid_idx ON g_account_organization (g_transaction_id);

CREATE TABLE g_account_organization_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_account integer,
    g_name character varying(1024),
    g_user character varying(1024),
    g_project character varying(1024),
    g_machine character varying(1024),
    g_type character varying(1024) DEFAULT 'Forward'
);

CREATE TABLE g_allocation (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_id integer,
    g_account integer,
    g_start_time integer DEFAULT 0,
    g_end_time integer DEFAULT 2147483647,
    g_amount double precision,
    g_credit_limit double precision DEFAULT 0,
    g_deposited double precision DEFAULT 0,
    g_active character varying(5) DEFAULT 'True',
    g_call_type character varying(1024) DEFAULT 'Normal',
    g_description character varying(1024)
);

CREATE INDEX g_allocation_id_idx ON g_allocation (g_id);
CREATE INDEX g_allocation_account_idx ON g_allocation (g_account);
CREATE INDEX g_allocation_time_idx ON g_allocation (g_start_time, g_end_time);
CREATE INDEX g_allocation_deleted_idx ON g_allocation (g_deleted);
CREATE INDEX g_allocation_txnid_idx ON g_allocation (g_transaction_id);

CREATE TABLE g_allocation_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_id integer,
    g_account integer,
    g_start_time integer DEFAULT 0,
    g_end_time integer DEFAULT 2147483647,
    g_amount double precision,
    g_credit_limit double precision DEFAULT 0,
    g_deposited double precision DEFAULT 0,
    g_active character varying(5) DEFAULT 'True',
    g_call_type character varying(1024) DEFAULT 'Normal',
    g_description character varying(1024)
);

CREATE TABLE g_reservation (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_id integer,
    g_name character varying(1024),
    g_job character varying(1024),
    g_user character varying(1024),
    g_project character varying(1024),
    g_machine character varying(1024),
    g_start_time integer DEFAULT 0,
    g_end_time integer DEFAULT 2147483647,
    g_call_type character varying(1024) DEFAULT 'Normal',
    g_description character varying(1024)
);

CREATE INDEX g_reservation_id_idx ON g_reservation (g_id);
CREATE INDEX g_reservation_name_idx ON g_reservation (g_name);
CREATE INDEX g_reservation_time_idx ON g_reservation (g_start_time, g_end_time);
CREATE INDEX g_reservation_deleted_idx ON g_reservation (g_deleted);
CREATE INDEX g_reservation_txnid_idx ON g_reservation (g_transaction_id);
create INDEX g_id_not_deleted_idx ON g_reservation (g_deleted) WHERE NOT g_deleted='True';

CREATE TABLE g_reservation_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_id integer,
    g_name character varying(1024),
    g_job character varying(1024),
    g_user character varying(1024),
    g_project character varying(1024),
    g_machine character varying(1024),
    g_start_time integer DEFAULT 0,
    g_end_time integer DEFAULT 2147483647,
    g_call_type character varying(1024) DEFAULT 'Normal',
    g_description character varying(1024)
);

CREATE TABLE g_reservation_allocation (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_reservation integer,
    g_id integer,
    g_account integer,
    g_amount double precision
);

CREATE INDEX g_reservation_allocation_reservation_idx ON g_reservation_allocation (g_reservation);
CREATE INDEX g_reservation_allocation_id_idx ON g_reservation_allocation (g_id);
CREATE INDEX g_reservation_allocation_account_idx ON g_reservation_allocation (g_account);
CREATE INDEX g_reservation_allocation_deleted_idx ON g_reservation_allocation (g_deleted);
CREATE INDEX g_reservation_allocation_txnid_idx ON g_reservation_allocation (g_transaction_id);
CREATE INDEX g_reservation_acct_where_idx ON g_reservation_allocation (g_account) WHERE g_deleted!='True';

CREATE TABLE g_reservation_allocation_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_reservation integer,
    g_id integer,
    g_account integer,
    g_amount double precision
);

CREATE TABLE g_quotation (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_id integer,
    g_amount double precision,
    g_start_time integer,
    g_end_time integer,
    g_wall_duration integer,
    g_job character varying(1024),
    g_user character varying(1024),
    g_project character varying(1024),
    g_machine character varying(1024),
    g_uses integer DEFAULT 1,
    g_call_type character varying(1024) DEFAULT 'Normal',
    g_description character varying(1024)
);

CREATE INDEX g_quotation_id_idx ON g_quotation (g_id);
CREATE INDEX g_quotation_time_idx ON g_quotation (g_start_time, g_end_time);
CREATE INDEX g_quotation_deleted_idx ON g_quotation (g_deleted);
CREATE INDEX g_quotation_txnid_idx ON g_quotation (g_transaction_id);

CREATE TABLE g_quotation_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_id integer,
    g_amount double precision,
    g_start_time integer,
    g_end_time integer,
    g_wall_duration integer,
    g_job character varying(1024),
    g_user character varying(1024),
    g_project character varying(1024),
    g_machine character varying(1024),
    g_uses integer DEFAULT 1,
    g_call_type character varying(1024) DEFAULT 'Normal',
    g_description character varying(1024)
);

CREATE TABLE g_charge_rate (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_type character varying(1024),
    g_name character varying(1024),
    g_instance character varying(1024),
    g_rate double precision,
    g_description character varying(1024)
);

CREATE INDEX g_charge_rate_type_idx ON g_charge_rate (g_type);
CREATE INDEX g_charge_rate_name_idx ON g_charge_rate (g_name);
CREATE INDEX g_charge_rate_instance_idx ON g_charge_rate (g_instance);
CREATE INDEX g_charge_rate_deleted_idx ON g_charge_rate (g_deleted);
CREATE INDEX g_charge_rate_txnid_idx ON g_charge_rate (g_transaction_id);

CREATE TABLE g_charge_rate_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_type character varying(1024),
    g_name character varying(1024),
    g_instance character varying(1024),
    g_rate double precision,
    g_description character varying(1024)
);

CREATE TABLE g_quotation_charge_rate (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_quotation integer,
    g_type character varying(1024),
    g_name character varying(1024),
    g_instance character varying(1024),
    g_rate double precision
);

CREATE TABLE g_quotation_charge_rate_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_quotation integer,
    g_type character varying(1024),
    g_name character varying(1024),
    g_instance character varying(1024),
    g_rate double precision
);

CREATE INDEX g_quotation_charge_rate_quotation_idx ON g_quotation_charge_rate (g_quotation);
CREATE INDEX g_quotation_charge_rate_type_idx ON g_quotation_charge_rate (g_type);
CREATE INDEX g_quotation_charge_rate_name_idx ON g_quotation_charge_rate (g_name);
CREATE INDEX g_quotation_charge_rate_instance_idx ON g_quotation_charge_rate (g_instance);
CREATE INDEX g_quotation_charge_rate_deleted_idx ON g_quotation_charge_rate (g_deleted);
CREATE INDEX g_quotation_charge_rate_txnid_idx ON g_quotation_charge_rate (g_transaction_id);

CREATE TABLE g_job (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_id integer,
    g_job_id character varying(1024),
    g_user character varying(1024),
    g_project character varying(1024),
    g_machine character varying(1024),
    g_charge double precision DEFAULT 0,
    g_queue character varying(1024),
    g_type character varying(1024),
    g_stage character varying(1024),
    g_quality_of_service character varying(1024),
    g_nodes integer,
    g_processors integer,
    g_executable character varying(1024),
    g_application character varying(1024),
    g_start_time integer,
    g_end_time integer,
    g_wall_duration integer,
    g_quote_id character varying(1024),
    g_call_type character varying(1024) DEFAULT 'Normal',
    g_description character varying(1024)
);

CREATE INDEX g_job_id_idx ON g_job (g_id);
CREATE INDEX g_job_jobid_idx ON g_job (g_job_id);
CREATE INDEX g_job_deleted_idx ON g_job (g_deleted);
CREATE INDEX g_job_txnid_idx ON g_job (g_transaction_id);

CREATE TABLE g_job_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_id integer,
    g_job_id character varying(1024),
    g_user character varying(1024),
    g_project character varying(1024),
    g_machine character varying(1024),
    g_charge double precision DEFAULT 0,
    g_queue character varying(1024),
    g_type character varying(1024),
    g_stage character varying(1024),
    g_quality_of_service character varying(1024),
    g_nodes integer,
    g_processors integer,
    g_executable character varying(1024),
    g_application character varying(1024),
    g_start_time integer,
    g_end_time integer,
    g_wall_duration integer,
    g_quote_id character varying(1024),
    g_call_type character varying(1024) DEFAULT 'Normal',
    g_description character varying(1024)
);

CREATE TABLE g_account_account (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_account integer,
    g_id integer,
    g_deposit_share integer DEFAULT 0,
    g_overflow character varying(5) DEFAULT 'False'
);

CREATE INDEX g_account_account_account_idx ON g_account_account (g_account);
CREATE INDEX g_account_account_id_idx ON g_account_account (g_id);
CREATE INDEX g_account_account_deleted_idx ON g_account_account (g_deleted);
CREATE INDEX g_account_account_txnid_idx ON g_account_account (g_transaction_id);

CREATE TABLE g_account_account_log (
    g_creation_time integer NOT NULL,
    g_modification_time integer NOT NULL,
    g_deleted character varying(5) DEFAULT 'False',
    g_request_id integer NOT NULL,
    g_transaction_id integer NOT NULL,
    g_account integer,
    g_id integer,
    g_deposit_share integer DEFAULT 0,
    g_overflow character varying(5) DEFAULT 'False'
);

INSERT INTO g_object VALUES ('Object', 'False', NULL, NULL, 'Object', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_object VALUES ('Attribute', 'False', NULL, NULL, 'Attribute', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_object VALUES ('Action', 'False', NULL, NULL, 'Action', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_object VALUES ('Transaction', 'False', NULL, NULL, 'Transaction Log', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_object VALUES ('System', 'False', NULL, NULL, 'System', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_object VALUES ('User', 'False', NULL, NULL, 'User', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_object VALUES ('Role', 'False', NULL, NULL, 'Role', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_object VALUES ('RoleAction', 'True', 'Role', 'Action', 'Role Action Association', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_object VALUES ('RoleUser', 'True', 'Role', 'User', 'Role User Association', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_object VALUES ('Password', 'False', NULL, NULL, 'Password', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_object VALUES ('ANY', 'False', NULL, NULL, 'Any Object', 'True', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_object VALUES ('NONE', 'False', NULL, NULL, 'No Object', 'True', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_object VALUES ('Organization', 'False', NULL, NULL, 'Virtual Organization', 'False', 'False', 1484308659, 1484308659, 9, 9);
INSERT INTO g_object VALUES ('Project', 'False', NULL, NULL, 'Project', 'False', 'False', 1484308659, 1484308659, 27, 27);
INSERT INTO g_object VALUES ('Machine', 'False', NULL, NULL, 'Machine', 'False', 'False', 1484308659, 1484308659, 38, 38);
INSERT INTO g_object VALUES ('ProjectUser', 'True', 'Project', 'User', 'Membership mapping Users to Projects', 'False', 'False', 1484308659, 1484308659, 51, 51);
INSERT INTO g_object VALUES ('ProjectMachine', 'True', 'Project', 'Machine', 'Membership mapping Machines to Projects', 'False', 'False', 1484308659, 1484308659, 61, 61);
INSERT INTO g_object VALUES ('Account', 'False', NULL, NULL, 'Account', 'False', 'False', 1484308659, 1484308659, 70, 70);
INSERT INTO g_object VALUES ('AccountProject', 'True', 'Account', 'Project', 'Project Access control List', 'False', 'False', 1484308659, 1484308659, 83, 83);
INSERT INTO g_object VALUES ('AccountUser', 'True', 'Account', 'User', 'User Access control List', 'False', 'False', 1484308659, 1484308659, 92, 92);
INSERT INTO g_object VALUES ('AccountMachine', 'True', 'Account', 'Machine', 'Machine Access control List', 'False', 'False', 1484308659, 1484308659, 101, 101);
INSERT INTO g_object VALUES ('AccountOrganization', 'True', 'Account', 'Organization', 'Forwarding Account Information', 'False', 'False', 1484308659, 1484308659, 110, 110);
INSERT INTO g_object VALUES ('Allocation', 'False', NULL, NULL, 'Allocation', 'False', 'False', 1484308659, 1484308659, 122, 122);
INSERT INTO g_object VALUES ('Reservation', 'False', NULL, NULL, 'Reservation', 'False', 'False', 1484308659, 1484308659, 139, 139);
INSERT INTO g_object VALUES ('ReservationAllocation', 'True', 'Reservation', 'Allocation', 'Reservation Allocation Association', 'False', 'False', 1484308659, 1484308659, 155, 155);
INSERT INTO g_object VALUES ('Quotation', 'False', NULL, NULL, 'Quotation', 'False', 'False', 1484308659, 1484308659, 165, 165);
INSERT INTO g_object VALUES ('ChargeRate', 'False', NULL, NULL, 'Charge Rates', 'False', 'False', 1484308659, 1484308659, 183, 183);
INSERT INTO g_object VALUES ('QuotationChargeRate', 'True', 'Quotation', 'ChargeRate', 'Charge Rate guaranteed by the associated Quotation', 'False', 'False', 1484308659, 1484308659, 193, 193);
INSERT INTO g_object VALUES ('Job', 'False', NULL, NULL, 'Job', 'False', 'False', 1484308659, 1484308659, 203, 203);
INSERT INTO g_object VALUES ('AccountAccount', 'True', 'Account', 'Account', 'Account Deposit Linkage', 'False', 'False', 1484308659, 1484308659, 233, 233);

INSERT INTO g_attribute VALUES ('Object', 'Name', 'String', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'Object Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Object', 'Association', 'Boolean', 'False', 'False', 'False', NULL, 'False', 20, 'False', 'Is this an association?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Object', 'Parent', 'String', 'False', 'False', 'False', '@Object', NULL, 30, 'False', 'Parent Association', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Object', 'Child', 'String', 'False', 'False', 'False', '@Object', NULL, 40, 'False', 'Child Association', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Object', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Object', 'Special', 'Boolean', 'False', 'False', 'False', NULL, 'False', 910, 'True', 'Is this a special object?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Object', 'CreationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 950, 'True', 'Time Created', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Object', 'ModificationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Object', 'Deleted', 'Boolean', 'False', 'False', 'False', NULL, 'False', 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Object', 'RequestId', 'Integer', 'False', 'False', 'False', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Object', 'TransactionId', 'Integer', 'False', 'False', 'False', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'Object', 'String', 'True', 'True', 'True', '@Object', NULL, 10, 'False', 'Object name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'Name', 'String', 'True', 'True', 'True', NULL, NULL, 20, 'False', 'Attribute Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'DataType', 'String', 'False', 'False', 'True', '(AutoGen,TimeStamp,Boolean,Float,Integer,Currency,String)', 'String', 30, 'False', 'Data Type', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'PrimaryKey', 'Boolean', 'False', 'False', 'False', NULL, 'False', 50, 'False', 'Is this a primary key?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'Required', 'Boolean', 'False', 'False', 'False', NULL, 'False', 60, 'False', 'Must this be non-null?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'Fixed', 'Boolean', 'False', 'False', 'False', NULL, 'False', 70, 'False', 'Is the Attribute Fixed?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'Values', 'String', 'False', 'False', 'False', NULL, NULL, 80, 'False', 'List of allowed values', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'DefaultValue', 'String', 'False', 'False', 'False', NULL, NULL, 90, 'False', 'Default value', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'Sequence', 'Integer', 'False', 'False', 'False', NULL, NULL, 100, 'False', 'Specifies ordering of attributes', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'Hidden', 'Boolean', 'False', 'False', 'False', NULL, 'False', 110, 'False', 'Is the Attribute Hidden by default?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'Special', 'Boolean', 'False', 'False', 'False', NULL, 'False', 910, 'True', 'Is this a special action?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'CreationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 950, 'True', 'Time Created', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'ModificationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'Deleted', 'Boolean', 'False', 'False', 'False', NULL, 'False', 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'RequestId', 'Integer', 'False', 'False', 'False', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Attribute', 'TransactionId', 'Integer', 'False', 'False', 'False', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Action', 'Object', 'String', 'True', 'True', 'True', '@Object', NULL, 10, 'False', 'Object Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Action', 'Name', 'String', 'True', 'True', 'True', NULL, NULL, 20, 'False', 'Action Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Action', 'Display', 'Boolean', 'False', 'False', 'False', NULL, 'False', 30, 'False', 'Should this action be displayed?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Action', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Action', 'Special', 'Boolean', 'False', 'False', 'False', NULL, 'False', 910, 'True', 'Is this a special action?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Action', 'CreationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 950, 'True', 'Time Created', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Action', 'ModificationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Action', 'Deleted', 'Boolean', 'False', 'False', 'False', NULL, 'False', 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Action', 'RequestId', 'Integer', 'False', 'False', 'False', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Action', 'TransactionId', 'Integer', 'False', 'False', 'False', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'Id', 'AutoGen', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'Transaction Record Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'Object', 'String', 'False', 'True', 'False', NULL, NULL, 20, 'False', 'Object', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'Action', 'String', 'False', 'True', 'False', NULL, NULL, 30, 'False', 'Action', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'Actor', 'String', 'False', 'True', 'False', NULL, NULL, 40, 'False', 'Authenticated User making the request', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'Name', 'String', 'False', 'False', 'False', NULL, NULL, 50, 'False', 'Object Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'Child', 'String', 'False', 'False', 'False', NULL, NULL, 60, 'False', 'Child Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'Count', 'Integer', 'False', 'False', 'False', NULL, NULL, 130, 'False', 'Object Count', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'Details', 'String', 'False', 'False', 'False', NULL, NULL, 170, 'True', 'Transaction Details', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'CreationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 950, 'True', 'Time Created', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'ModificationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'Deleted', 'Boolean', 'False', 'False', 'False', NULL, 'False', 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'RequestId', 'Integer', 'False', 'False', 'False', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'TransactionId', 'Integer', 'False', 'False', 'False', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('System', 'Name', 'String', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'System Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('System', 'Version', 'String', 'False', 'True', 'False', NULL, NULL, 20, 'False', 'System Version', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('System', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('System', 'CreationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 950, 'True', 'Time Created', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('System', 'ModificationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('System', 'Deleted', 'Boolean', 'False', 'False', 'False', NULL, 'False', 970, 'True', 'Is this Object Deleted?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('System', 'RequestId', 'Integer', 'False', 'False', 'False', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('System', 'TransactionId', 'Integer', 'False', 'False', 'False', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('User', 'Name', 'String', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'User Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('User', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('User', 'Special', 'Boolean', 'False', 'False', 'False', NULL, 'False', 910, 'True', 'Is this a special user?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('User', 'CreationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 950, 'True', 'Time Created', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('User', 'ModificationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('User', 'Deleted', 'Boolean', 'False', 'False', 'False', NULL, 'False', 970, 'True', 'Is this Object Deleted?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('User', 'RequestId', 'Integer', 'False', 'False', 'False', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('User', 'TransactionId', 'Integer', 'False', 'False', 'False', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Role', 'Name', 'String', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'Role Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Role', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Role', 'CreationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 950, 'True', 'Time Created', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Role', 'ModificationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Role', 'Deleted', 'Boolean', 'False', 'False', 'False', NULL, 'False', 970, 'True', 'Is this Object Deleted?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Role', 'RequestId', 'Integer', 'False', 'False', 'False', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Role', 'TransactionId', 'Integer', 'False', 'False', 'False', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleAction', 'Role', 'String', 'True', 'True', 'True', '@Role', NULL, 10, 'False', 'Parent Role Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleAction', 'Object', 'String', 'True', 'True', 'True', '@Object', NULL, 20, 'False', 'Child Object Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleAction', 'Name', 'String', 'True', 'True', 'True', NULL, NULL, 30, 'False', 'Child Action Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleAction', 'Instance', 'String', 'False', 'False', 'False', NULL, 'ANY', 40, 'False', 'Object Instance Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleAction', 'CreationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 950, 'True', 'Time Created', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleAction', 'ModificationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleAction', 'Deleted', 'Boolean', 'False', 'False', 'False', NULL, 'False', 970, 'True', 'Is this Object Deleted?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleAction', 'RequestId', 'Integer', 'False', 'False', 'False', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleAction', 'TransactionId', 'Integer', 'False', 'False', 'False', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleUser', 'Role', 'String', 'True', 'True', 'True', '@Role', NULL, 10, 'False', 'Parent Role Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleUser', 'Name', 'String', 'True', 'True', 'True', '@User', NULL, 20, 'False', 'Child User Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleUser', 'CreationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 950, 'True', 'Time Created', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleUser', 'ModificationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleUser', 'Deleted', 'Boolean', 'False', 'False', 'False', NULL, 'False', 970, 'True', 'Is this Object Deleted?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleUser', 'RequestId', 'Integer', 'False', 'False', 'False', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('RoleUser', 'TransactionId', 'Integer', 'False', 'False', 'False', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Password', 'User', 'String', 'True', 'True', 'True', '@User', NULL, 10, 'False', 'User Name', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Password', 'Password', 'String', 'False', 'False', 'False', NULL, NULL, 20, 'False', 'Password', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Password', 'CreationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 950, 'True', 'Time Created', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Password', 'ModificationTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Password', 'Deleted', 'Boolean', 'False', 'False', 'False', NULL, 'False', 970, 'True', 'Is this Object Deleted?', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Password', 'RequestId', 'Integer', 'False', 'False', 'False', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Password', 'TransactionId', 'Integer', 'False', 'False', 'False', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_attribute VALUES ('Transaction', 'Project', 'String', 'False', 'False', 'False', NULL, NULL, 180, 'False', 'Project Name', 'False', 'False', 1484308659, 1484308659, 1, 1);
INSERT INTO g_attribute VALUES ('Transaction', 'User', 'String', 'False', 'False', 'False', NULL, NULL, 190, 'False', 'User Name', 'False', 'False', 1484308659, 1484308659, 2, 2);
INSERT INTO g_attribute VALUES ('Transaction', 'Machine', 'String', 'False', 'False', 'False', NULL, NULL, 200, 'False', 'Machine Name', 'False', 'False', 1484308659, 1484308659, 3, 3);
INSERT INTO g_attribute VALUES ('Transaction', 'JobId', 'String', 'False', 'False', 'False', NULL, NULL, 210, 'False', 'Job Id', 'False', 'False', 1484308659, 1484308659, 4, 4);
INSERT INTO g_attribute VALUES ('Transaction', 'Amount', 'Currency', 'False', 'False', 'False', NULL, NULL, 220, 'False', 'Amount', 'False', 'False', 1484308659, 1484308659, 5, 5);
INSERT INTO g_attribute VALUES ('Transaction', 'Delta', 'Currency', 'False', 'False', 'False', NULL, NULL, 230, 'False', 'Account Delta', 'False', 'False', 1484308659, 1484308659, 6, 6);
INSERT INTO g_attribute VALUES ('Transaction', 'Account', 'Integer', 'False', 'False', 'False', NULL, NULL, 240, 'False', 'Account Id', 'False', 'False', 1484308659, 1484308659, 7, 7);
INSERT INTO g_attribute VALUES ('Transaction', 'Allocation', 'Integer', 'False', 'False', 'False', NULL, NULL, 250, 'False', 'Allocation Id', 'False', 'False', 1484308659, 1484308659, 8, 8);
INSERT INTO g_attribute VALUES ('Organization', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 9, 9);
INSERT INTO g_attribute VALUES ('Organization', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 9, 9);
INSERT INTO g_attribute VALUES ('Organization', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 9, 9);
INSERT INTO g_attribute VALUES ('Organization', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 9, 9);
INSERT INTO g_attribute VALUES ('Organization', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 9, 9);
INSERT INTO g_attribute VALUES ('Organization', 'Name', 'String', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'Organization Name', 'False', 'False', 1484308659, 1484308659, 10, 10);
INSERT INTO g_attribute VALUES ('Organization', 'Host', 'String', 'False', 'False', 'False', NULL, NULL, 20, 'False', 'Host Name', 'False', 'False', 1484308659, 1484308659, 11, 11);
INSERT INTO g_attribute VALUES ('Organization', 'Port', 'String', 'False', 'False', 'False', NULL, NULL, 30, 'False', 'Port Number', 'False', 'False', 1484308659, 1484308659, 12, 12);
INSERT INTO g_attribute VALUES ('Organization', 'Special', 'Boolean', 'False', 'False', 'False', NULL, 'False', 200, 'True', 'Is this a Special Organization?', 'False', 'False', 1484308659, 1484308659, 13, 13);
INSERT INTO g_attribute VALUES ('Organization', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 14, 14);
INSERT INTO g_attribute VALUES ('System', 'Organization', 'String', 'False', 'False', 'False', '@Organization', NULL, 30, 'False', 'Organization Name', 'False', 'False', 1484308659, 1484308659, 20, 20);
INSERT INTO g_attribute VALUES ('User', 'Active', 'Boolean', 'False', 'False', 'False', NULL, 'True', 20, 'False', 'Is the User Active?', 'False', 'False', 1484308659, 1484308659, 21, 21);
INSERT INTO g_attribute VALUES ('User', 'CommonName', 'String', 'False', 'False', 'False', NULL, NULL, 30, 'False', 'Full Name', 'False', 'False', 1484308659, 1484308659, 22, 22);
INSERT INTO g_attribute VALUES ('User', 'PhoneNumber', 'String', 'False', 'False', 'False', NULL, NULL, 40, 'False', 'Phone Number', 'False', 'False', 1484308659, 1484308659, 23, 23);
INSERT INTO g_attribute VALUES ('User', 'EmailAddress', 'String', 'False', 'False', 'False', NULL, NULL, 50, 'False', 'Email Address', 'False', 'False', 1484308659, 1484308659, 24, 24);
INSERT INTO g_attribute VALUES ('User', 'DefaultProject', 'String', 'False', 'False', 'False', '@Project', NULL, 60, 'False', 'Default Project', 'False', 'False', 1484308659, 1484308659, 25, 25);
INSERT INTO g_attribute VALUES ('User', 'Organization', 'String', 'False', 'False', 'False', '@Organization', NULL, 70, 'False', 'Organization', 'False', 'False', 1484308659, 1484308659, 26, 26);
INSERT INTO g_attribute VALUES ('Project', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 27, 27);
INSERT INTO g_attribute VALUES ('Project', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 27, 27);
INSERT INTO g_attribute VALUES ('Project', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 27, 27);
INSERT INTO g_attribute VALUES ('Project', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 27, 27);
INSERT INTO g_attribute VALUES ('Project', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 27, 27);
INSERT INTO g_attribute VALUES ('Project', 'Name', 'String', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'Project Name', 'False', 'False', 1484308659, 1484308659, 28, 28);
INSERT INTO g_attribute VALUES ('Project', 'Active', 'Boolean', 'False', 'False', 'False', NULL, 'True', 20, 'False', 'Is the Project Active?', 'False', 'False', 1484308659, 1484308659, 29, 29);
INSERT INTO g_attribute VALUES ('Project', 'Organization', 'String', 'False', 'False', 'False', '@Organization', NULL, 30, 'False', 'Organization', 'False', 'False', 1484308659, 1484308659, 30, 30);
INSERT INTO g_attribute VALUES ('Project', 'Special', 'Boolean', 'False', 'False', 'False', NULL, 'False', 200, 'True', 'Is this a Special Project?', 'False', 'False', 1484308659, 1484308659, 31, 31);
INSERT INTO g_attribute VALUES ('Project', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 32, 32);
INSERT INTO g_attribute VALUES ('Machine', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 38, 38);
INSERT INTO g_attribute VALUES ('Machine', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 38, 38);
INSERT INTO g_attribute VALUES ('Machine', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 38, 38);
INSERT INTO g_attribute VALUES ('Machine', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 38, 38);
INSERT INTO g_attribute VALUES ('Machine', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 38, 38);
INSERT INTO g_attribute VALUES ('Machine', 'Name', 'String', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'Machine Name', 'False', 'False', 1484308659, 1484308659, 39, 39);
INSERT INTO g_attribute VALUES ('Machine', 'Active', 'Boolean', 'False', 'False', 'False', NULL, 'True', 20, 'False', 'Is the Machine Active?', 'False', 'False', 1484308659, 1484308659, 40, 40);
INSERT INTO g_attribute VALUES ('Machine', 'Architecture', 'String', 'False', 'False', 'False', NULL, NULL, 30, 'False', 'System Architecture', 'False', 'False', 1484308659, 1484308659, 41, 41);
INSERT INTO g_attribute VALUES ('Machine', 'OperatingSystem', 'String', 'False', 'False', 'False', NULL, NULL, 40, 'False', 'Operating System', 'False', 'False', 1484308659, 1484308659, 42, 42);
INSERT INTO g_attribute VALUES ('Machine', 'Organization', 'String', 'False', 'False', 'False', '@Organization', NULL, 50, 'False', 'Organization', 'False', 'False', 1484308659, 1484308659, 43, 43);
INSERT INTO g_attribute VALUES ('Machine', 'Special', 'Boolean', 'False', 'False', 'False', NULL, 'False', 200, 'True', 'Is this a Special Machine?', 'False', 'False', 1484308659, 1484308659, 44, 44);
INSERT INTO g_attribute VALUES ('Machine', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 45, 45);
INSERT INTO g_attribute VALUES ('ProjectUser', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 51, 51);
INSERT INTO g_attribute VALUES ('ProjectUser', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 51, 51);
INSERT INTO g_attribute VALUES ('ProjectUser', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 51, 51);
INSERT INTO g_attribute VALUES ('ProjectUser', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 51, 51);
INSERT INTO g_attribute VALUES ('ProjectUser', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 51, 51);
INSERT INTO g_attribute VALUES ('ProjectUser', 'Project', 'String', 'True', 'True', 'True', '@Project', NULL, 10, 'False', 'Parent Project Name', 'False', 'False', 1484308659, 1484308659, 52, 52);
INSERT INTO g_attribute VALUES ('ProjectUser', 'Name', 'String', 'True', 'True', 'True', '@User', NULL, 20, 'False', 'Member User Name', 'False', 'False', 1484308659, 1484308659, 53, 53);
INSERT INTO g_attribute VALUES ('ProjectUser', 'Active', 'Boolean', 'False', 'False', 'False', NULL, 'True', 30, 'False', 'Is this subProject Active?', 'False', 'False', 1484308659, 1484308659, 54, 54);
INSERT INTO g_attribute VALUES ('ProjectUser', 'Admin', 'Boolean', 'False', 'False', 'False', NULL, 'False', 40, 'False', 'Is this user a Project Administrator?', 'False', 'False', 1484308659, 1484308659, 55, 55);
INSERT INTO g_attribute VALUES ('ProjectMachine', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 61, 61);
INSERT INTO g_attribute VALUES ('ProjectMachine', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 61, 61);
INSERT INTO g_attribute VALUES ('ProjectMachine', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 61, 61);
INSERT INTO g_attribute VALUES ('ProjectMachine', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 61, 61);
INSERT INTO g_attribute VALUES ('ProjectMachine', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 61, 61);
INSERT INTO g_attribute VALUES ('ProjectMachine', 'Project', 'String', 'True', 'True', 'True', '@Project', NULL, 10, 'False', 'Parent Project Name', 'False', 'False', 1484308659, 1484308659, 62, 62);
INSERT INTO g_attribute VALUES ('ProjectMachine', 'Name', 'String', 'True', 'True', 'True', '@Machine', NULL, 20, 'False', 'Member Machine Name', 'False', 'False', 1484308659, 1484308659, 63, 63);
INSERT INTO g_attribute VALUES ('ProjectMachine', 'Active', 'Boolean', 'False', 'False', 'False', NULL, 'True', 30, 'False', 'Is this subProject Active?', 'False', 'False', 1484308659, 1484308659, 64, 64);
INSERT INTO g_attribute VALUES ('Account', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 70, 70);
INSERT INTO g_attribute VALUES ('Account', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 70, 70);
INSERT INTO g_attribute VALUES ('Account', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 70, 70);
INSERT INTO g_attribute VALUES ('Account', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 70, 70);
INSERT INTO g_attribute VALUES ('Account', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 70, 70);
INSERT INTO g_attribute VALUES ('Account', 'Id', 'AutoGen', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'Account Id', 'False', 'False', 1484308659, 1484308659, 71, 71);
INSERT INTO g_attribute VALUES ('Account', 'Name', 'String', 'False', 'False', 'False', NULL, NULL, 20, 'False', 'Account Name', 'False', 'False', 1484308659, 1484308659, 72, 72);
INSERT INTO g_attribute VALUES ('Account', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 73, 73);
INSERT INTO g_attribute VALUES ('AccountProject', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 83, 83);
INSERT INTO g_attribute VALUES ('AccountProject', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 83, 83);
INSERT INTO g_attribute VALUES ('AccountProject', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 83, 83);
INSERT INTO g_attribute VALUES ('AccountProject', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 83, 83);
INSERT INTO g_attribute VALUES ('AccountProject', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 83, 83);
INSERT INTO g_attribute VALUES ('AccountProject', 'Account', 'Integer', 'True', 'True', 'True', '@Account', NULL, 10, 'False', 'Parent Account Id', 'False', 'False', 1484308659, 1484308659, 84, 84);
INSERT INTO g_attribute VALUES ('AccountProject', 'Name', 'String', 'True', 'True', 'True', '@Project', NULL, 20, 'False', 'Child Project Name', 'False', 'False', 1484308659, 1484308659, 85, 85);
INSERT INTO g_attribute VALUES ('AccountProject', 'Access', 'Boolean', 'False', 'False', 'False', NULL, 'True', 30, 'False', 'Access Allowed? (vs Denied)', 'False', 'False', 1484308659, 1484308659, 86, 86);
INSERT INTO g_attribute VALUES ('AccountUser', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 92, 92);
INSERT INTO g_attribute VALUES ('AccountUser', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 92, 92);
INSERT INTO g_attribute VALUES ('AccountUser', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 92, 92);
INSERT INTO g_attribute VALUES ('AccountUser', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 92, 92);
INSERT INTO g_attribute VALUES ('AccountUser', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 92, 92);
INSERT INTO g_attribute VALUES ('AccountUser', 'Account', 'Integer', 'True', 'True', 'True', '@Account', NULL, 10, 'False', 'Parent Account Id', 'False', 'False', 1484308659, 1484308659, 93, 93);
INSERT INTO g_attribute VALUES ('AccountUser', 'Name', 'String', 'True', 'True', 'True', '@User', NULL, 20, 'False', 'Child User Name', 'False', 'False', 1484308659, 1484308659, 94, 94);
INSERT INTO g_attribute VALUES ('AccountUser', 'Access', 'Boolean', 'False', 'False', 'False', NULL, 'True', 30, 'False', 'Access Allowed? (vs Denied)', 'False', 'False', 1484308659, 1484308659, 95, 95);
INSERT INTO g_attribute VALUES ('AccountMachine', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 101, 101);
INSERT INTO g_attribute VALUES ('AccountMachine', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 101, 101);
INSERT INTO g_attribute VALUES ('AccountMachine', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 101, 101);
INSERT INTO g_attribute VALUES ('AccountMachine', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 101, 101);
INSERT INTO g_attribute VALUES ('AccountMachine', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 101, 101);
INSERT INTO g_attribute VALUES ('AccountMachine', 'Account', 'Integer', 'True', 'True', 'True', '@Account', NULL, 10, 'False', 'Parent Account Id', 'False', 'False', 1484308659, 1484308659, 102, 102);
INSERT INTO g_attribute VALUES ('AccountMachine', 'Name', 'String', 'True', 'True', 'True', '@Machine', NULL, 20, 'False', 'Child Machine Name', 'False', 'False', 1484308659, 1484308659, 103, 103);
INSERT INTO g_attribute VALUES ('AccountMachine', 'Access', 'Boolean', 'False', 'False', 'False', NULL, 'True', 30, 'False', 'Access Allowed? (vs Denied)', 'False', 'False', 1484308659, 1484308659, 104, 104);
INSERT INTO g_attribute VALUES ('AccountOrganization', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 110, 110);
INSERT INTO g_attribute VALUES ('AccountOrganization', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 110, 110);
INSERT INTO g_attribute VALUES ('AccountOrganization', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 110, 110);
INSERT INTO g_attribute VALUES ('AccountOrganization', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 110, 110);
INSERT INTO g_attribute VALUES ('AccountOrganization', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 110, 110);
INSERT INTO g_attribute VALUES ('AccountOrganization', 'Account', 'Integer', 'True', 'True', 'True', '@Account', NULL, 10, 'False', 'Parent Account Id', 'False', 'False', 1484308659, 1484308659, 111, 111);
INSERT INTO g_attribute VALUES ('AccountOrganization', 'Name', 'String', 'True', 'True', 'True', '@Organization', NULL, 20, 'False', 'Child Organization Name', 'False', 'False', 1484308659, 1484308659, 112, 112);
INSERT INTO g_attribute VALUES ('AccountOrganization', 'User', 'String', 'False', 'False', 'False', NULL, NULL, 30, 'False', 'Forwarding User', 'False', 'False', 1484308659, 1484308659, 113, 113);
INSERT INTO g_attribute VALUES ('AccountOrganization', 'Project', 'String', 'False', 'False', 'False', NULL, NULL, 40, 'False', 'Forwarding Project', 'False', 'False', 1484308659, 1484308659, 114, 114);
INSERT INTO g_attribute VALUES ('AccountOrganization', 'Machine', 'String', 'False', 'False', 'False', NULL, NULL, 50, 'False', 'Forwarding Machine', 'False', 'False', 1484308659, 1484308659, 115, 115);
INSERT INTO g_attribute VALUES ('AccountOrganization', 'Type', 'String', 'False', 'False', 'False', NULL, 'Forward', 60, 'False', 'Service Type', 'False', 'False', 1484308659, 1484308659, 116, 116);
INSERT INTO g_attribute VALUES ('Allocation', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 122, 122);
INSERT INTO g_attribute VALUES ('Allocation', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 122, 122);
INSERT INTO g_attribute VALUES ('Allocation', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 122, 122);
INSERT INTO g_attribute VALUES ('Allocation', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 122, 122);
INSERT INTO g_attribute VALUES ('Allocation', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 122, 122);
INSERT INTO g_attribute VALUES ('Allocation', 'Id', 'AutoGen', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'Allocation Id', 'False', 'False', 1484308659, 1484308659, 123, 123);
INSERT INTO g_attribute VALUES ('Allocation', 'Account', 'Integer', 'False', 'True', 'True', '@Account', NULL, 20, 'False', 'Account Id', 'False', 'False', 1484308659, 1484308659, 124, 124);
INSERT INTO g_attribute VALUES ('Allocation', 'StartTime', 'TimeStamp', 'False', 'False', 'False', NULL, '-infinity', 30, 'False', 'Start Time', 'False', 'False', 1484308659, 1484308659, 125, 125);
INSERT INTO g_attribute VALUES ('Allocation', 'EndTime', 'TimeStamp', 'False', 'False', 'False', NULL, 'infinity', 40, 'False', 'End Time', 'False', 'False', 1484308659, 1484308659, 126, 126);
INSERT INTO g_attribute VALUES ('Allocation', 'Amount', 'Currency', 'False', 'True', 'False', NULL, NULL, 50, 'False', 'Amount', 'False', 'False', 1484308659, 1484308659, 127, 127);
INSERT INTO g_attribute VALUES ('Allocation', 'CreditLimit', 'Currency', 'False', 'False', 'False', NULL, '0', 60, 'False', 'Credit Limit', 'False', 'False', 1484308659, 1484308659, 128, 128);
INSERT INTO g_attribute VALUES ('Allocation', 'Deposited', 'Currency', 'False', 'False', 'False', NULL, '0', 70, 'False', 'Total Deposited', 'False', 'False', 1484308659, 1484308659, 129, 129);
INSERT INTO g_attribute VALUES ('Allocation', 'Active', 'Boolean', 'False', 'False', 'False', NULL, 'True', 80, 'False', 'Is the Allocation Active?', 'False', 'False', 1484308659, 1484308659, 130, 130);
INSERT INTO g_attribute VALUES ('Allocation', 'CallType', 'String', 'False', 'False', 'False', '(Back,Forward,Normal)', 'Normal', 200, 'True', 'Call Type', 'False', 'False', 1484308659, 1484308659, 131, 131);
INSERT INTO g_attribute VALUES ('Allocation', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 132, 132);
INSERT INTO g_attribute VALUES ('Reservation', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 139, 139);
INSERT INTO g_attribute VALUES ('Reservation', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 139, 139);
INSERT INTO g_attribute VALUES ('Reservation', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 139, 139);
INSERT INTO g_attribute VALUES ('Reservation', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 139, 139);
INSERT INTO g_attribute VALUES ('Reservation', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 139, 139);
INSERT INTO g_attribute VALUES ('Reservation', 'Id', 'AutoGen', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'Reservation Id', 'False', 'False', 1484308659, 1484308659, 140, 140);
INSERT INTO g_attribute VALUES ('Reservation', 'Name', 'String', 'False', 'False', 'False', NULL, NULL, 20, 'False', 'Reservation Name', 'False', 'False', 1484308659, 1484308659, 141, 141);
INSERT INTO g_attribute VALUES ('Reservation', 'Job', 'String', 'False', 'False', 'False', '@Job', NULL, 30, 'False', 'Gold Job Id', 'False', 'False', 1484308659, 1484308659, 142, 142);
INSERT INTO g_attribute VALUES ('Reservation', 'User', 'String', 'False', 'False', 'False', '@User', NULL, 40, 'False', 'User Name', 'False', 'False', 1484308659, 1484308659, 143, 143);
INSERT INTO g_attribute VALUES ('Reservation', 'Project', 'String', 'False', 'False', 'False', '@Project', NULL, 50, 'False', 'Project Name', 'False', 'False', 1484308659, 1484308659, 144, 144);
INSERT INTO g_attribute VALUES ('Reservation', 'Machine', 'String', 'False', 'False', 'False', '@Machine', NULL, 60, 'False', 'Machine Name', 'False', 'False', 1484308659, 1484308659, 145, 145);
INSERT INTO g_attribute VALUES ('Reservation', 'StartTime', 'TimeStamp', 'False', 'False', 'False', NULL, '-infinity', 70, 'False', 'When does this Reservation start?', 'False', 'False', 1484308659, 1484308659, 146, 146);
INSERT INTO g_attribute VALUES ('Reservation', 'EndTime', 'TimeStamp', 'False', 'False', 'False', NULL, 'infinity', 80, 'False', 'When does this Reservation expire?', 'False', 'False', 1484308659, 1484308659, 147, 147);
INSERT INTO g_attribute VALUES ('Reservation', 'CallType', 'String', 'False', 'False', 'False', '(Back,Forward,Normal)', 'Normal', 200, 'True', 'Call Type', 'False', 'False', 1484308659, 1484308659, 148, 148);
INSERT INTO g_attribute VALUES ('Reservation', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 149, 149);
INSERT INTO g_attribute VALUES ('ReservationAllocation', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 155, 155);
INSERT INTO g_attribute VALUES ('ReservationAllocation', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 155, 155);
INSERT INTO g_attribute VALUES ('ReservationAllocation', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 155, 155);
INSERT INTO g_attribute VALUES ('ReservationAllocation', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 155, 155);
INSERT INTO g_attribute VALUES ('ReservationAllocation', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 155, 155);
INSERT INTO g_attribute VALUES ('ReservationAllocation', 'Reservation', 'Integer', 'True', 'True', 'True', '@Reservation', NULL, 10, 'False', 'Parent Reservation Id', 'False', 'False', 1484308659, 1484308659, 156, 156);
INSERT INTO g_attribute VALUES ('ReservationAllocation', 'Id', 'Integer', 'True', 'True', 'True', '@Allocation', NULL, 20, 'False', 'Child Allocation Id', 'False', 'False', 1484308659, 1484308659, 157, 157);
INSERT INTO g_attribute VALUES ('ReservationAllocation', 'Account', 'Integer', 'False', 'True', 'False', '@Account', NULL, 30, 'False', 'Account Id', 'False', 'False', 1484308659, 1484308659, 158, 158);
INSERT INTO g_attribute VALUES ('ReservationAllocation', 'Amount', 'Currency', 'False', 'True', 'False', NULL, NULL, 40, 'False', 'Resource Credits', 'False', 'False', 1484308659, 1484308659, 159, 159);
INSERT INTO g_attribute VALUES ('Quotation', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 165, 165);
INSERT INTO g_attribute VALUES ('Quotation', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 165, 165);
INSERT INTO g_attribute VALUES ('Quotation', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 165, 165);
INSERT INTO g_attribute VALUES ('Quotation', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 165, 165);
INSERT INTO g_attribute VALUES ('Quotation', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 165, 165);
INSERT INTO g_attribute VALUES ('Quotation', 'Id', 'AutoGen', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'Quotation Id', 'False', 'False', 1484308659, 1484308659, 166, 166);
INSERT INTO g_attribute VALUES ('Quotation', 'Amount', 'Currency', 'False', 'False', 'False', NULL, NULL, 20, 'False', 'Charge Estimate (calculated)', 'False', 'False', 1484308659, 1484308659, 167, 167);
INSERT INTO g_attribute VALUES ('Quotation', 'StartTime', 'TimeStamp', 'False', 'True', 'False', NULL, NULL, 30, 'False', 'When does this Quotation start?', 'False', 'False', 1484308659, 1484308659, 168, 168);
INSERT INTO g_attribute VALUES ('Quotation', 'EndTime', 'TimeStamp', 'False', 'True', 'False', NULL, NULL, 40, 'False', 'When does this Quotation expire?', 'False', 'False', 1484308659, 1484308659, 169, 169);
INSERT INTO g_attribute VALUES ('Quotation', 'WallDuration', 'Integer', 'False', 'False', 'False', NULL, NULL, 50, 'False', 'WallTime Estimate', 'False', 'False', 1484308659, 1484308659, 170, 170);
INSERT INTO g_attribute VALUES ('Quotation', 'Job', 'String', 'False', 'False', 'False', '@Job', NULL, 60, 'False', 'Gold Job Id', 'False', 'False', 1484308659, 1484308659, 171, 171);
INSERT INTO g_attribute VALUES ('Quotation', 'User', 'String', 'False', 'False', 'False', '@User', NULL, 70, 'False', 'User Name', 'False', 'False', 1484308659, 1484308659, 172, 172);
INSERT INTO g_attribute VALUES ('Quotation', 'Project', 'String', 'False', 'False', 'False', '@Project', NULL, 80, 'False', 'Project Name', 'False', 'False', 1484308659, 1484308659, 173, 173);
INSERT INTO g_attribute VALUES ('Quotation', 'Machine', 'String', 'False', 'False', 'False', '@Machine', NULL, 90, 'False', 'Machine Name', 'False', 'False', 1484308659, 1484308659, 174, 174);
INSERT INTO g_attribute VALUES ('Quotation', 'Uses', 'Integer', 'False', 'False', 'False', NULL, '1', 100, 'False', 'Number of Times Quote can be Used', 'False', 'False', 1484308659, 1484308659, 175, 175);
INSERT INTO g_attribute VALUES ('Quotation', 'CallType', 'String', 'False', 'False', 'False', '(Back,Forward,Normal)', 'Normal', 200, 'True', 'Call Type', 'False', 'False', 1484308659, 1484308659, 176, 176);
INSERT INTO g_attribute VALUES ('Quotation', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 177, 177);
INSERT INTO g_attribute VALUES ('ChargeRate', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 183, 183);
INSERT INTO g_attribute VALUES ('ChargeRate', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 183, 183);
INSERT INTO g_attribute VALUES ('ChargeRate', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 183, 183);
INSERT INTO g_attribute VALUES ('ChargeRate', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 183, 183);
INSERT INTO g_attribute VALUES ('ChargeRate', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 183, 183);
INSERT INTO g_attribute VALUES ('ChargeRate', 'Type', 'String', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'Charge Rate Type', 'False', 'False', 1484308659, 1484308659, 184, 184);
INSERT INTO g_attribute VALUES ('ChargeRate', 'Name', 'String', 'True', 'True', 'True', NULL, NULL, 20, 'False', 'Charge Rate Name', 'False', 'False', 1484308659, 1484308659, 185, 185);
INSERT INTO g_attribute VALUES ('ChargeRate', 'Instance', 'String', 'True', 'False', 'True', NULL, '', 30, 'False', 'Charge Rate Instance', 'False', 'False', 1484308659, 1484308659, 185, 185);
INSERT INTO g_attribute VALUES ('ChargeRate', 'Rate', 'Float', 'False', 'True', 'False', NULL, NULL, 40, 'False', 'Charge Rate', 'False', 'False', 1484308659, 1484308659, 186, 186);
INSERT INTO g_attribute VALUES ('ChargeRate', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 187, 187);
INSERT INTO g_attribute VALUES ('QuotationChargeRate', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 193, 193);
INSERT INTO g_attribute VALUES ('QuotationChargeRate', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 193, 193);
INSERT INTO g_attribute VALUES ('QuotationChargeRate', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 193, 193);
INSERT INTO g_attribute VALUES ('QuotationChargeRate', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 193, 193);
INSERT INTO g_attribute VALUES ('QuotationChargeRate', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 193, 193);
INSERT INTO g_attribute VALUES ('QuotationChargeRate', 'Quotation', 'Integer', 'True', 'True', 'True', '@Quotation', NULL, 10, 'False', 'Parent Quotation Id', 'False', 'False', 1484308659, 1484308659, 194, 194);
INSERT INTO g_attribute VALUES ('QuotationChargeRate', 'Type', 'String', 'True', 'True', 'True', NULL, NULL, 20, 'False', 'Charge Rate Type', 'False', 'False', 1484308659, 1484308659, 195, 195);
INSERT INTO g_attribute VALUES ('QuotationChargeRate', 'Name', 'String', 'True', 'True', 'True', NULL, NULL, 30, 'False', 'Charge Rate Name', 'False', 'False', 1484308659, 1484308659, 196, 196);
INSERT INTO g_attribute VALUES ('QuotationChargeRate', 'Instance', 'String', 'True', 'False', 'True', NULL, '', 40, 'False', 'Charge Rate Name', 'False', 'False', 1484308659, 1484308659, 196, 196);
INSERT INTO g_attribute VALUES ('QuotationChargeRate', 'Rate', 'Float', 'False', 'True', 'False', NULL, NULL, 50, 'False', 'Charge Rate', 'False', 'False', 1484308659, 1484308659, 197, 197);
INSERT INTO g_attribute VALUES ('Job', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 203, 203);
INSERT INTO g_attribute VALUES ('Job', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 203, 203);
INSERT INTO g_attribute VALUES ('Job', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 203, 203);
INSERT INTO g_attribute VALUES ('Job', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 203, 203);
INSERT INTO g_attribute VALUES ('Job', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 203, 203);
INSERT INTO g_attribute VALUES ('Job', 'Id', 'AutoGen', 'True', 'True', 'True', NULL, NULL, 10, 'False', 'Instance Id', 'False', 'False', 1484308659, 1484308659, 204, 204);
INSERT INTO g_attribute VALUES ('Job', 'JobId', 'String', 'False', 'True', 'False', NULL, NULL, 20, 'False', 'Job Id', 'False', 'False', 1484308659, 1484308659, 205, 205);
INSERT INTO g_attribute VALUES ('Job', 'User', 'String', 'False', 'False', 'False', NULL, NULL, 30, 'False', 'User Name', 'False', 'False', 1484308659, 1484308659, 206, 206);
INSERT INTO g_attribute VALUES ('Job', 'Project', 'String', 'False', 'False', 'False', NULL, NULL, 40, 'False', 'Project Name', 'False', 'False', 1484308659, 1484308659, 207, 207);
INSERT INTO g_attribute VALUES ('Job', 'Machine', 'String', 'False', 'False', 'False', NULL, NULL, 50, 'False', 'Machine Name', 'False', 'False', 1484308659, 1484308659, 208, 208);
INSERT INTO g_attribute VALUES ('Job', 'Charge', 'Currency', 'False', 'False', 'False', NULL, '0', 60, 'False', 'Amount Charged for Job', 'False', 'False', 1484308659, 1484308659, 209, 209);
INSERT INTO g_attribute VALUES ('Job', 'Queue', 'String', 'False', 'False', 'False', NULL, NULL, 70, 'False', 'Class or Queue', 'False', 'False', 1484308659, 1484308659, 210, 210);
INSERT INTO g_attribute VALUES ('Job', 'Type', 'String', 'False', 'False', 'False', NULL, NULL, 80, 'False', 'Job Type', 'False', 'False', 1484308659, 1484308659, 211, 211);
INSERT INTO g_attribute VALUES ('Job', 'Stage', 'String', 'False', 'False', 'False', '(Charge,Create,Quote,Reserve)', NULL, 90, 'False', 'Last Job Stage', 'False', 'False', 1484308659, 1484308659, 212, 212);
INSERT INTO g_attribute VALUES ('Job', 'QualityOfService', 'String', 'False', 'False', 'False', NULL, NULL, 100, 'False', 'Quality of Service', 'False', 'False', 1484308659, 1484308659, 213, 213);
INSERT INTO g_attribute VALUES ('Job', 'Nodes', 'Integer', 'False', 'False', 'False', NULL, NULL, 110, 'False', 'Number of Nodes for the Job', 'False', 'False', 1484308659, 1484308659, 214, 214);
INSERT INTO g_attribute VALUES ('Job', 'Processors', 'Integer', 'False', 'False', 'False', NULL, NULL, 120, 'False', 'Number of Processors for the Job', 'False', 'False', 1484308659, 1484308659, 215, 215);
INSERT INTO g_attribute VALUES ('Job', 'Executable', 'String', 'False', 'False', 'False', NULL, NULL, 130, 'False', 'Executable', 'False', 'False', 1484308659, 1484308659, 216, 216);
INSERT INTO g_attribute VALUES ('Job', 'Application', 'String', 'False', 'False', 'False', '(Gaussian,Nwchem)', NULL, 140, 'False', 'Application', 'False', 'False', 1484308659, 1484308659, 217, 217);
INSERT INTO g_attribute VALUES ('Job', 'StartTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 150, 'False', 'Start Time', 'False', 'False', 1484308659, 1484308659, 218, 218);
INSERT INTO g_attribute VALUES ('Job', 'EndTime', 'TimeStamp', 'False', 'False', 'False', NULL, NULL, 160, 'False', 'Completion Time', 'False', 'False', 1484308659, 1484308659, 219, 219);
INSERT INTO g_attribute VALUES ('Job', 'WallDuration', 'Integer', 'False', 'False', 'False', NULL, NULL, 170, 'False', 'Wallclock Time in seconds', 'False', 'False', 1484308659, 1484308659, 220, 220);
INSERT INTO g_attribute VALUES ('Job', 'QuoteId', 'String', 'False', 'False', 'False', NULL, NULL, 180, 'False', 'Quote Id', 'False', 'False', 1484308659, 1484308659, 221, 221);
INSERT INTO g_attribute VALUES ('Job', 'CallType', 'String', 'False', 'False', 'False', '(Back,Forward,Normal)', 'Normal', 200, 'True', 'Call Type', 'False', 'False', 1484308659, 1484308659, 222, 222);
INSERT INTO g_attribute VALUES ('Job', 'Description', 'String', 'False', 'False', 'False', NULL, NULL, 900, 'False', 'Description', 'False', 'False', 1484308659, 1484308659, 223, 223);
INSERT INTO g_attribute VALUES ('AccountAccount', 'CreationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 950, 'True', 'First Created', 'False', 'False', 1484308659, 1484308659, 233, 233);
INSERT INTO g_attribute VALUES ('AccountAccount', 'ModificationTime', 'TimeStamp', 'False', 'False', 'True', NULL, NULL, 960, 'True', 'Last Updated', 'False', 'False', 1484308659, 1484308659, 233, 233);
INSERT INTO g_attribute VALUES ('AccountAccount', 'Deleted', 'Boolean', 'False', 'False', 'True', NULL, NULL, 970, 'True', 'Is this object deleted?', 'False', 'False', 1484308659, 1484308659, 233, 233);
INSERT INTO g_attribute VALUES ('AccountAccount', 'RequestId', 'Integer', 'False', 'False', 'True', NULL, NULL, 980, 'True', 'Last Modifying Request Id', 'False', 'False', 1484308659, 1484308659, 233, 233);
INSERT INTO g_attribute VALUES ('AccountAccount', 'TransactionId', 'Integer', 'False', 'False', 'True', NULL, NULL, 990, 'True', 'Last Modifying Transaction Id', 'False', 'False', 1484308659, 1484308659, 233, 233);
INSERT INTO g_attribute VALUES ('AccountAccount', 'Account', 'String', 'True', 'True', 'True', '@Account', NULL, 10, 'False', 'Parent Account Id', 'False', 'False', 1484308659, 1484308659, 234, 234);
INSERT INTO g_attribute VALUES ('AccountAccount', 'Id', 'String', 'True', 'True', 'True', '@Account', NULL, 20, 'False', 'Child Account Id', 'False', 'False', 1484308659, 1484308659, 235, 235);
INSERT INTO g_attribute VALUES ('AccountAccount', 'DepositShare', 'Integer', 'False', 'True', 'False', NULL, '0', 30, 'False', 'Deposit Share', 'False', 'False', 1484308659, 1484308659, 236, 236);
INSERT INTO g_attribute VALUES ('AccountAccount', 'Overflow', 'Boolean', 'False', 'False', 'False', NULL, 'False', 40, 'False', 'Do descendant charges overflow into this Account?', 'False', 'False', 1484308659, 1484308659, 237, 237);

INSERT INTO g_action VALUES ('Object', 'Create', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Object', 'Query', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Object', 'Modify', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Object', 'Delete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Object', 'Undelete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Attribute', 'Create', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Attribute', 'Query', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Attribute', 'Modify', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Attribute', 'Delete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Attribute', 'Undelete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Action', 'Create', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Action', 'Query', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Action', 'Modify', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Action', 'Delete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Action', 'Undelete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Transaction', 'Query', 'True', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Transaction', 'Undo', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Transaction', 'Redo', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('System', 'Create', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('System', 'Query', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('System', 'Modify', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('System', 'Delete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('System', 'Undelete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('System', 'Refresh', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('User', 'Create', 'True', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('User', 'Query', 'True', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('User', 'Modify', 'True', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('User', 'Delete', 'True', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('User', 'Undelete', 'True', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Role', 'Create', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Role', 'Query', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Role', 'Modify', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Role', 'Delete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Role', 'Undelete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('RoleAction', 'Create', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('RoleAction', 'Query', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('RoleAction', 'Modify', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('RoleAction', 'Delete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('RoleAction', 'Undelete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('RoleUser', 'Create', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('RoleUser', 'Query', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('RoleUser', 'Modify', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('RoleUser', 'Delete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('RoleUser', 'Undelete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Password', 'Create', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Password', 'Query', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Password', 'Modify', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Password', 'Delete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Password', 'Undelete', 'False', NULL, 'False', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('ANY', 'ANY', 'False', 'Any Action', 'True', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('NONE', 'NONE', 'False', 'No Action', 'True', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_action VALUES ('Organization', 'Create', 'True', 'Create', 'False', 'False', 1484308659, 1484308659, 15, 15);
INSERT INTO g_action VALUES ('Organization', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 16, 16);
INSERT INTO g_action VALUES ('Organization', 'Modify', 'True', 'Modify', 'False', 'False', 1484308659, 1484308659, 17, 17);
INSERT INTO g_action VALUES ('Organization', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 18, 18);
INSERT INTO g_action VALUES ('Organization', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 19, 19);
INSERT INTO g_action VALUES ('Project', 'Create', 'True', 'Create', 'False', 'False', 1484308659, 1484308659, 33, 33);
INSERT INTO g_action VALUES ('Project', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 34, 34);
INSERT INTO g_action VALUES ('Project', 'Modify', 'True', 'Modify', 'False', 'False', 1484308659, 1484308659, 35, 35);
INSERT INTO g_action VALUES ('Project', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 36, 36);
INSERT INTO g_action VALUES ('Project', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 37, 37);
INSERT INTO g_action VALUES ('Machine', 'Create', 'True', 'Create', 'False', 'False', 1484308659, 1484308659, 46, 46);
INSERT INTO g_action VALUES ('Machine', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 47, 47);
INSERT INTO g_action VALUES ('Machine', 'Modify', 'True', 'Modify', 'False', 'False', 1484308659, 1484308659, 48, 48);
INSERT INTO g_action VALUES ('Machine', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 49, 49);
INSERT INTO g_action VALUES ('Machine', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 50, 50);
INSERT INTO g_action VALUES ('ProjectUser', 'Create', 'True', 'Create', 'False', 'False', 1484308659, 1484308659, 56, 56);
INSERT INTO g_action VALUES ('ProjectUser', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 57, 57);
INSERT INTO g_action VALUES ('ProjectUser', 'Modify', 'True', 'Modify', 'False', 'False', 1484308659, 1484308659, 58, 58);
INSERT INTO g_action VALUES ('ProjectUser', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 59, 59);
INSERT INTO g_action VALUES ('ProjectUser', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 60, 60);
INSERT INTO g_action VALUES ('ProjectMachine', 'Create', 'True', 'Create', 'False', 'False', 1484308659, 1484308659, 65, 65);
INSERT INTO g_action VALUES ('ProjectMachine', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 66, 66);
INSERT INTO g_action VALUES ('ProjectMachine', 'Modify', 'True', 'Modify', 'False', 'False', 1484308659, 1484308659, 67, 67);
INSERT INTO g_action VALUES ('ProjectMachine', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 68, 68);
INSERT INTO g_action VALUES ('ProjectMachine', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 69, 69);
INSERT INTO g_action VALUES ('Account', 'Create', 'True', 'Create', 'False', 'False', 1484308659, 1484308659, 74, 74);
INSERT INTO g_action VALUES ('Account', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 75, 75);
INSERT INTO g_action VALUES ('Account', 'Modify', 'True', 'Modify', 'False', 'False', 1484308659, 1484308659, 76, 76);
INSERT INTO g_action VALUES ('Account', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 77, 77);
INSERT INTO g_action VALUES ('Account', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 78, 78);
INSERT INTO g_action VALUES ('Account', 'Withdraw', 'True', 'Withdraw', 'False', 'False', 1484308659, 1484308659, 79, 79);
INSERT INTO g_action VALUES ('Account', 'Balance', 'True', 'Balance', 'False', 'False', 1484308659, 1484308659, 80, 80);
INSERT INTO g_action VALUES ('Account', 'Deposit', 'True', 'Deposit', 'False', 'False', 1484308659, 1484308659, 81, 81);
INSERT INTO g_action VALUES ('Account', 'Transfer', 'True', 'Transfer', 'False', 'False', 1484308659, 1484308659, 82, 82);
INSERT INTO g_action VALUES ('AccountProject', 'Create', 'True', 'Create', 'False', 'False', 1484308659, 1484308659, 87, 87);
INSERT INTO g_action VALUES ('AccountProject', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 88, 88);
INSERT INTO g_action VALUES ('AccountProject', 'Modify', 'True', 'Modify', 'False', 'False', 1484308659, 1484308659, 89, 89);
INSERT INTO g_action VALUES ('AccountProject', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 90, 90);
INSERT INTO g_action VALUES ('AccountProject', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 91, 91);
INSERT INTO g_action VALUES ('AccountUser', 'Create', 'True', 'Create', 'False', 'False', 1484308659, 1484308659, 96, 96);
INSERT INTO g_action VALUES ('AccountUser', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 97, 97);
INSERT INTO g_action VALUES ('AccountUser', 'Modify', 'True', 'Modify', 'False', 'False', 1484308659, 1484308659, 98, 98);
INSERT INTO g_action VALUES ('AccountUser', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 99, 99);
INSERT INTO g_action VALUES ('AccountUser', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 100, 100);
INSERT INTO g_action VALUES ('AccountMachine', 'Create', 'True', 'Create', 'False', 'False', 1484308659, 1484308659, 105, 105);
INSERT INTO g_action VALUES ('AccountMachine', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 106, 106);
INSERT INTO g_action VALUES ('AccountMachine', 'Modify', 'True', 'Modify', 'False', 'False', 1484308659, 1484308659, 107, 107);
INSERT INTO g_action VALUES ('AccountMachine', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 108, 108);
INSERT INTO g_action VALUES ('AccountMachine', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 109, 109);
INSERT INTO g_action VALUES ('AccountOrganization', 'Create', 'False', 'Create', 'False', 'False', 1484308659, 1484308659, 117, 117);
INSERT INTO g_action VALUES ('AccountOrganization', 'Query', 'False', 'Query', 'False', 'False', 1484308659, 1484308659, 118, 118);
INSERT INTO g_action VALUES ('AccountOrganization', 'Modify', 'False', 'Modify', 'False', 'False', 1484308659, 1484308659, 119, 119);
INSERT INTO g_action VALUES ('AccountOrganization', 'Delete', 'False', 'Delete', 'False', 'False', 1484308659, 1484308659, 120, 120);
INSERT INTO g_action VALUES ('AccountOrganization', 'Undelete', 'False', 'Undelete', 'False', 'False', 1484308659, 1484308659, 121, 121);
INSERT INTO g_action VALUES ('Allocation', 'Create', 'False', 'Create', 'False', 'False', 1484308659, 1484308659, 133, 133);
INSERT INTO g_action VALUES ('Allocation', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 134, 134);
INSERT INTO g_action VALUES ('Allocation', 'Modify', 'True', 'Modify', 'False', 'False', 1484308659, 1484308659, 135, 135);
INSERT INTO g_action VALUES ('Allocation', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 136, 136);
INSERT INTO g_action VALUES ('Allocation', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 137, 137);
INSERT INTO g_action VALUES ('Allocation', 'Refresh', 'False', 'Refresh', 'False', 'False', 1484308659, 1484308659, 138, 138);
INSERT INTO g_action VALUES ('Reservation', 'Create', 'False', 'Create', 'False', 'False', 1484308659, 1484308659, 150, 150);
INSERT INTO g_action VALUES ('Reservation', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 151, 151);
INSERT INTO g_action VALUES ('Reservation', 'Modify', 'False', 'Modify', 'False', 'False', 1484308659, 1484308659, 152, 152);
INSERT INTO g_action VALUES ('Reservation', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 153, 153);
INSERT INTO g_action VALUES ('Reservation', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 154, 154);
INSERT INTO g_action VALUES ('ReservationAllocation', 'Create', 'False', 'Create', 'False', 'False', 1484308659, 1484308659, 160, 160);
INSERT INTO g_action VALUES ('ReservationAllocation', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 161, 161);
INSERT INTO g_action VALUES ('ReservationAllocation', 'Modify', 'False', 'Modify', 'False', 'False', 1484308659, 1484308659, 162, 162);
INSERT INTO g_action VALUES ('ReservationAllocation', 'Delete', 'False', 'Delete', 'False', 'False', 1484308659, 1484308659, 163, 163);
INSERT INTO g_action VALUES ('ReservationAllocation', 'Undelete', 'False', 'Undelete', 'False', 'False', 1484308659, 1484308659, 164, 164);
INSERT INTO g_action VALUES ('Quotation', 'Create', 'False', 'Create', 'False', 'False', 1484308659, 1484308659, 178, 178);
INSERT INTO g_action VALUES ('Quotation', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 179, 179);
INSERT INTO g_action VALUES ('Quotation', 'Modify', 'False', 'Modify', 'False', 'False', 1484308659, 1484308659, 180, 180);
INSERT INTO g_action VALUES ('Quotation', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 181, 181);
INSERT INTO g_action VALUES ('Quotation', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 182, 182);
INSERT INTO g_action VALUES ('ChargeRate', 'Create', 'True', 'Create', 'False', 'False', 1484308659, 1484308659, 188, 188);
INSERT INTO g_action VALUES ('ChargeRate', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 189, 189);
INSERT INTO g_action VALUES ('ChargeRate', 'Modify', 'True', 'Modify', 'False', 'False', 1484308659, 1484308659, 190, 190);
INSERT INTO g_action VALUES ('ChargeRate', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 191, 191);
INSERT INTO g_action VALUES ('ChargeRate', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 192, 192);
INSERT INTO g_action VALUES ('QuotationChargeRate', 'Create', 'False', 'Create', 'False', 'False', 1484308659, 1484308659, 198, 198);
INSERT INTO g_action VALUES ('QuotationChargeRate', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 199, 199);
INSERT INTO g_action VALUES ('QuotationChargeRate', 'Modify', 'False', 'Modify', 'False', 'False', 1484308659, 1484308659, 200, 200);
INSERT INTO g_action VALUES ('QuotationChargeRate', 'Delete', 'False', 'Delete', 'False', 'False', 1484308659, 1484308659, 201, 201);
INSERT INTO g_action VALUES ('QuotationChargeRate', 'Undelete', 'False', 'Undelete', 'False', 'False', 1484308659, 1484308659, 202, 202);
INSERT INTO g_action VALUES ('Job', 'Create', 'True', 'Create', 'False', 'False', 1484308659, 1484308659, 224, 224);
INSERT INTO g_action VALUES ('Job', 'Query', 'True', 'Query', 'False', 'False', 1484308659, 1484308659, 225, 225);
INSERT INTO g_action VALUES ('Job', 'Modify', 'True', 'Modify', 'False', 'False', 1484308659, 1484308659, 226, 226);
INSERT INTO g_action VALUES ('Job', 'Delete', 'True', 'Delete', 'False', 'False', 1484308659, 1484308659, 227, 227);
INSERT INTO g_action VALUES ('Job', 'Undelete', 'True', 'Undelete', 'False', 'False', 1484308659, 1484308659, 228, 228);
INSERT INTO g_action VALUES ('Job', 'Charge', 'False', 'Charge', 'False', 'False', 1484308659, 1484308659, 229, 229);
INSERT INTO g_action VALUES ('Job', 'Reserve', 'False', 'Reserve', 'False', 'False', 1484308659, 1484308659, 230, 230);
INSERT INTO g_action VALUES ('Job', 'Quote', 'False', 'Quote', 'False', 'False', 1484308659, 1484308659, 231, 231);
INSERT INTO g_action VALUES ('Job', 'Refund', 'True', 'Refund', 'False', 'False', 1484308659, 1484308659, 232, 232);
INSERT INTO g_action VALUES ('AccountAccount', 'Create', 'False', 'Create', 'False', 'False', 1484308659, 1484308659, 238, 238);
INSERT INTO g_action VALUES ('AccountAccount', 'Query', 'False', 'Query', 'False', 'False', 1484308659, 1484308659, 239, 239);
INSERT INTO g_action VALUES ('AccountAccount', 'Modify', 'False', 'Modify', 'False', 'False', 1484308659, 1484308659, 240, 240);
INSERT INTO g_action VALUES ('AccountAccount', 'Delete', 'False', 'Delete', 'False', 'False', 1484308659, 1484308659, 241, 241);
INSERT INTO g_action VALUES ('AccountAccount', 'Undelete', 'False', 'Undelete', 'False', 'False', 1484308659, 1484308659, 242, 242);

INSERT INTO g_transaction VALUES (1, 'Attribute', 'Create', 'gold', 'Project', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Transaction,DataType=String,Sequence=180', 'Project Name', 'False', 1484308659, 1484308659, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (2, 'Attribute', 'Create', 'gold', 'User', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Transaction,DataType=String,Sequence=190', 'User Name', 'False', 1484308659, 1484308659, 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (3, 'Attribute', 'Create', 'gold', 'Machine', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Transaction,DataType=String,Sequence=200', 'Machine Name', 'False', 1484308659, 1484308659, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (4, 'Attribute', 'Create', 'gold', 'JobId', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Transaction,DataType=String,Sequence=210', 'Job Id', 'False', 1484308659, 1484308659, 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (5, 'Attribute', 'Create', 'gold', 'Amount', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Transaction,DataType=Currency,Sequence=220', 'Amount', 'False', 1484308659, 1484308659, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (6, 'Attribute', 'Create', 'gold', 'Delta', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Transaction,DataType=Currency,Sequence=230', 'Account Delta', 'False', 1484308659, 1484308659, 6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (7, 'Attribute', 'Create', 'gold', 'Account', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Transaction,DataType=Integer,Sequence=240', 'Account Id', 'False', 1484308659, 1484308659, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (8, 'Attribute', 'Create', 'gold', 'Allocation', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Transaction,DataType=Integer,Sequence=250', 'Allocation Id', 'False', 1484308659, 1484308659, 8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (9, 'Object', 'Create', 'gold', 'Organization', NULL, 1, 'Deleted=False,Association=False,Special=False', 'Virtual Organization', 'False', 1484308659, 1484308659, 9, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (10, 'Attribute', 'Create', 'gold', 'Name', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Deleted=False,Hidden=False,Object=Organization,DataType=String,Sequence=10', 'Organization Name', 'False', 1484308659, 1484308659, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (11, 'Attribute', 'Create', 'gold', 'Host', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Organization,DataType=String,Sequence=20', 'Host Name', 'False', 1484308659, 1484308659, 11, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (12, 'Attribute', 'Create', 'gold', 'Port', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Organization,DataType=String,Sequence=30', 'Port Number', 'False', 1484308659, 1484308659, 12, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (13, 'Attribute', 'Create', 'gold', 'Special', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Object=Organization,Hidden=True,DataType=Boolean,DefaultValue=False,Sequence=200', 'Is this a Special Organization?', 'False', 1484308659, 1484308659, 13, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (14, 'Attribute', 'Create', 'gold', 'Description', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Organization,DataType=String,Sequence=900', 'Description', 'False', 1484308659, 1484308659, 14, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (15, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=True,Deleted=False,Object=Organization,Special=False', 'Create', 'False', 1484308659, 1484308659, 15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (16, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=Organization,Special=False', 'Query', 'False', 1484308659, 1484308659, 16, 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (17, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=Organization,Special=False', 'Modify', 'False', 1484308659, 1484308659, 17, 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (18, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=Organization,Special=False', 'Delete', 'False', 1484308659, 1484308659, 18, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (19, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=Organization,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 19, 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (20, 'Attribute', 'Create', 'gold', 'Organization', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=@Organization,Deleted=False,Hidden=False,Object=System,DataType=String,Sequence=30', 'Organization Name', 'False', 1484308659, 1484308659, 20, 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (21, 'Attribute', 'Create', 'gold', 'Active', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=User,DataType=Boolean,DefaultValue=True,Sequence=20', 'Is the User Active?', 'False', 1484308659, 1484308659, 21, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (22, 'Attribute', 'Create', 'gold', 'CommonName', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=User,DataType=String,Sequence=30', 'Full Name', 'False', 1484308659, 1484308659, 22, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (23, 'Attribute', 'Create', 'gold', 'PhoneNumber', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=User,DataType=String,Sequence=40', 'Phone Number', 'False', 1484308659, 1484308659, 23, 23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (24, 'Attribute', 'Create', 'gold', 'EmailAddress', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=User,DataType=String,Sequence=50', 'Email Address', 'False', 1484308659, 1484308659, 24, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (25, 'Attribute', 'Create', 'gold', 'DefaultProject', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=@Project,Deleted=False,Hidden=False,Object=User,DataType=String,Sequence=60', 'Default Project', 'False', 1484308659, 1484308659, 25, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (26, 'Attribute', 'Create', 'gold', 'Organization', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=@Organization,Deleted=False,Hidden=False,Object=User,DataType=String,Sequence=70', 'Organization', 'False', 1484308659, 1484308659, 26, 26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (27, 'Object', 'Create', 'gold', 'Project', NULL, 1, 'Deleted=False,Association=False,Special=False', 'Project', 'False', 1484308659, 1484308659, 27, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (28, 'Attribute', 'Create', 'gold', 'Name', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Deleted=False,Hidden=False,Object=Project,DataType=String,Sequence=10', 'Project Name', 'False', 1484308659, 1484308659, 28, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (29, 'Attribute', 'Create', 'gold', 'Active', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Project,DataType=Boolean,DefaultValue=True,Sequence=20', 'Is the Project Active?', 'False', 1484308659, 1484308659, 29, 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (30, 'Attribute', 'Create', 'gold', 'Organization', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=@Organization,Deleted=False,Hidden=False,Object=Project,DataType=String,Sequence=30', 'Organization', 'False', 1484308659, 1484308659, 30, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (31, 'Attribute', 'Create', 'gold', 'Special', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Object=Project,Hidden=True,DataType=Boolean,DefaultValue=False,Sequence=200', 'Is this a Special Project?', 'False', 1484308659, 1484308659, 31, 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (32, 'Attribute', 'Create', 'gold', 'Description', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Project,DataType=String,Sequence=900', 'Description', 'False', 1484308659, 1484308659, 32, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (33, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=True,Deleted=False,Object=Project,Special=False', 'Create', 'False', 1484308659, 1484308659, 33, 33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (34, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=Project,Special=False', 'Query', 'False', 1484308659, 1484308659, 34, 34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (35, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=Project,Special=False', 'Modify', 'False', 1484308659, 1484308659, 35, 35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (36, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=Project,Special=False', 'Delete', 'False', 1484308659, 1484308659, 36, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (37, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=Project,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 37, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (38, 'Object', 'Create', 'gold', 'Machine', NULL, 1, 'Deleted=False,Association=False,Special=False', 'Machine', 'False', 1484308659, 1484308659, 38, 38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (39, 'Attribute', 'Create', 'gold', 'Name', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Deleted=False,Hidden=False,Object=Machine,DataType=String,Sequence=10', 'Machine Name', 'False', 1484308659, 1484308659, 39, 39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (40, 'Attribute', 'Create', 'gold', 'Active', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Machine,DataType=Boolean,DefaultValue=True,Sequence=20', 'Is the Machine Active?', 'False', 1484308659, 1484308659, 40, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (41, 'Attribute', 'Create', 'gold', 'Architecture', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Machine,DataType=String,Sequence=30', 'System Architecture', 'False', 1484308659, 1484308659, 41, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (42, 'Attribute', 'Create', 'gold', 'OperatingSystem', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Machine,DataType=String,Sequence=40', 'Operating System', 'False', 1484308659, 1484308659, 42, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (43, 'Attribute', 'Create', 'gold', 'Organization', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=@Organization,Deleted=False,Hidden=False,Object=Machine,DataType=String,Sequence=50', 'Organization', 'False', 1484308659, 1484308659, 43, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (44, 'Attribute', 'Create', 'gold', 'Special', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Object=Machine,Hidden=True,DataType=Boolean,DefaultValue=False,Sequence=200', 'Is this a Special Machine?', 'False', 1484308659, 1484308659, 44, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (45, 'Attribute', 'Create', 'gold', 'Description', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Machine,DataType=String,Sequence=900', 'Description', 'False', 1484308659, 1484308659, 45, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (46, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=True,Deleted=False,Object=Machine,Special=False', 'Create', 'False', 1484308659, 1484308659, 46, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (47, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=Machine,Special=False', 'Query', 'False', 1484308659, 1484308659, 47, 47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (48, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=Machine,Special=False', 'Modify', 'False', 1484308659, 1484308659, 48, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (49, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=Machine,Special=False', 'Delete', 'False', 1484308659, 1484308659, 49, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (50, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=Machine,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (51, 'Object', 'Create', 'gold', 'ProjectUser', NULL, 1, 'Deleted=False,Child=User,Special=False,Parent=Project,Association=True', 'Membership mapping Users to Projects', 'False', 1484308659, 1484308659, 51, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (52, 'Attribute', 'Create', 'gold', 'Project', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Project,Deleted=False,Hidden=False,Object=ProjectUser,DataType=String,Sequence=10', 'Parent Project Name', 'False', 1484308659, 1484308659, 52, 52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (53, 'Attribute', 'Create', 'gold', 'Name', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@User,Deleted=False,Hidden=False,Object=ProjectUser,DataType=String,Sequence=20', 'Member User Name', 'False', 1484308659, 1484308659, 53, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (54, 'Attribute', 'Create', 'gold', 'Active', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=ProjectUser,DataType=Boolean,DefaultValue=True,Sequence=30', 'Is this subProject Active?', 'False', 1484308659, 1484308659, 54, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (55, 'Attribute', 'Create', 'gold', 'Admin', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=ProjectUser,DataType=Boolean,DefaultValue=False,Sequence=40', 'Is this user a Project Administrator?', 'False', 1484308659, 1484308659, 55, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (56, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=True,Deleted=False,Object=ProjectUser,Special=False', 'Create', 'False', 1484308659, 1484308659, 56, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (57, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=ProjectUser,Special=False', 'Query', 'False', 1484308659, 1484308659, 57, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (58, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=ProjectUser,Special=False', 'Modify', 'False', 1484308659, 1484308659, 58, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (59, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=ProjectUser,Special=False', 'Delete', 'False', 1484308659, 1484308659, 59, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (60, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=ProjectUser,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 60, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (61, 'Object', 'Create', 'gold', 'ProjectMachine', NULL, 1, 'Deleted=False,Child=Machine,Special=False,Parent=Project,Association=True', 'Membership mapping Machines to Projects', 'False', 1484308659, 1484308659, 61, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (62, 'Attribute', 'Create', 'gold', 'Project', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Project,Deleted=False,Hidden=False,Object=ProjectMachine,DataType=String,Sequence=10', 'Parent Project Name', 'False', 1484308659, 1484308659, 62, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (63, 'Attribute', 'Create', 'gold', 'Name', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Machine,Deleted=False,Hidden=False,Object=ProjectMachine,DataType=String,Sequence=20', 'Member Machine Name', 'False', 1484308659, 1484308659, 63, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (64, 'Attribute', 'Create', 'gold', 'Active', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=ProjectMachine,DataType=Boolean,DefaultValue=True,Sequence=30', 'Is this subProject Active?', 'False', 1484308659, 1484308659, 64, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (65, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=True,Deleted=False,Object=ProjectMachine,Special=False', 'Create', 'False', 1484308659, 1484308659, 65, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (66, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=ProjectMachine,Special=False', 'Query', 'False', 1484308659, 1484308659, 66, 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (67, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=ProjectMachine,Special=False', 'Modify', 'False', 1484308659, 1484308659, 67, 67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (68, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=ProjectMachine,Special=False', 'Delete', 'False', 1484308659, 1484308659, 68, 68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (69, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=ProjectMachine,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 69, 69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (70, 'Object', 'Create', 'gold', 'Account', NULL, 1, 'Deleted=False,Association=False,Special=False', 'Account', 'False', 1484308659, 1484308659, 70, 70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (71, 'Attribute', 'Create', 'gold', 'Id', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Deleted=False,Hidden=False,Object=Account,DataType=AutoGen,Sequence=10', 'Account Id', 'False', 1484308659, 1484308659, 71, 71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (72, 'Attribute', 'Create', 'gold', 'Name', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Account,DataType=String,Sequence=20', 'Account Name', 'False', 1484308659, 1484308659, 72, 72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (73, 'Attribute', 'Create', 'gold', 'Description', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Account,DataType=String,Sequence=900', 'Description', 'False', 1484308659, 1484308659, 73, 73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (74, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=True,Deleted=False,Object=Account,Special=False', 'Create', 'False', 1484308659, 1484308659, 74, 74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (75, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=Account,Special=False', 'Query', 'False', 1484308659, 1484308659, 75, 75, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (76, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=Account,Special=False', 'Modify', 'False', 1484308659, 1484308659, 76, 76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (77, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=Account,Special=False', 'Delete', 'False', 1484308659, 1484308659, 77, 77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (78, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=Account,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 78, 78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (79, 'Action', 'Create', 'gold', 'Withdraw', NULL, 1, 'Display=True,Deleted=False,Object=Account,Special=False', 'Withdraw', 'False', 1484308659, 1484308659, 79, 79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (80, 'Action', 'Create', 'gold', 'Balance', NULL, 1, 'Display=True,Deleted=False,Object=Account,Special=False', 'Balance', 'False', 1484308659, 1484308659, 80, 80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (81, 'Action', 'Create', 'gold', 'Deposit', NULL, 1, 'Display=True,Deleted=False,Object=Account,Special=False', 'Deposit', 'False', 1484308659, 1484308659, 81, 81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (82, 'Action', 'Create', 'gold', 'Transfer', NULL, 1, 'Display=True,Deleted=False,Object=Account,Special=False', 'Transfer', 'False', 1484308659, 1484308659, 82, 82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (83, 'Object', 'Create', 'gold', 'AccountProject', NULL, 1, 'Deleted=False,Child=Project,Special=False,Parent=Account,Association=True', 'Project Access control List', 'False', 1484308659, 1484308659, 83, 83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (84, 'Attribute', 'Create', 'gold', 'Account', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Account,Deleted=False,Hidden=False,Object=AccountProject,DataType=Integer,Sequence=10', 'Parent Account Id', 'False', 1484308659, 1484308659, 84, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (85, 'Attribute', 'Create', 'gold', 'Name', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Project,Deleted=False,Hidden=False,Object=AccountProject,DataType=String,Sequence=20', 'Child Project Name', 'False', 1484308659, 1484308659, 85, 85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (86, 'Attribute', 'Create', 'gold', 'Access', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=AccountProject,DataType=Boolean,DefaultValue=True,Sequence=30', 'Access Allowed? (vs Denied)', 'False', 1484308659, 1484308659, 86, 86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (87, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=True,Deleted=False,Object=AccountProject,Special=False', 'Create', 'False', 1484308659, 1484308659, 87, 87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (88, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=AccountProject,Special=False', 'Query', 'False', 1484308659, 1484308659, 88, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (89, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=AccountProject,Special=False', 'Modify', 'False', 1484308659, 1484308659, 89, 89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (90, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=AccountProject,Special=False', 'Delete', 'False', 1484308659, 1484308659, 90, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (91, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=AccountProject,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 91, 91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (92, 'Object', 'Create', 'gold', 'AccountUser', NULL, 1, 'Deleted=False,Child=User,Special=False,Parent=Account,Association=True', 'User Access control List', 'False', 1484308659, 1484308659, 92, 92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (93, 'Attribute', 'Create', 'gold', 'Account', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Account,Deleted=False,Hidden=False,Object=AccountUser,DataType=Integer,Sequence=10', 'Parent Account Id', 'False', 1484308659, 1484308659, 93, 93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (94, 'Attribute', 'Create', 'gold', 'Name', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@User,Deleted=False,Hidden=False,Object=AccountUser,DataType=String,Sequence=20', 'Child User Name', 'False', 1484308659, 1484308659, 94, 94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (95, 'Attribute', 'Create', 'gold', 'Access', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=AccountUser,DataType=Boolean,DefaultValue=True,Sequence=30', 'Access Allowed? (vs Denied)', 'False', 1484308659, 1484308659, 95, 95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (96, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=True,Deleted=False,Object=AccountUser,Special=False', 'Create', 'False', 1484308659, 1484308659, 96, 96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (97, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=AccountUser,Special=False', 'Query', 'False', 1484308659, 1484308659, 97, 97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (98, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=AccountUser,Special=False', 'Modify', 'False', 1484308659, 1484308659, 98, 98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (99, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=AccountUser,Special=False', 'Delete', 'False', 1484308659, 1484308659, 99, 99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (100, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=AccountUser,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 100, 100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (101, 'Object', 'Create', 'gold', 'AccountMachine', NULL, 1, 'Deleted=False,Child=Machine,Special=False,Parent=Account,Association=True', 'Machine Access control List', 'False', 1484308659, 1484308659, 101, 101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (102, 'Attribute', 'Create', 'gold', 'Account', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Account,Deleted=False,Hidden=False,Object=AccountMachine,DataType=Integer,Sequence=10', 'Parent Account Id', 'False', 1484308659, 1484308659, 102, 102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (103, 'Attribute', 'Create', 'gold', 'Name', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Machine,Deleted=False,Hidden=False,Object=AccountMachine,DataType=String,Sequence=20', 'Child Machine Name', 'False', 1484308659, 1484308659, 103, 103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (104, 'Attribute', 'Create', 'gold', 'Access', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=AccountMachine,DataType=Boolean,DefaultValue=True,Sequence=30', 'Access Allowed? (vs Denied)', 'False', 1484308659, 1484308659, 104, 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (105, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=True,Deleted=False,Object=AccountMachine,Special=False', 'Create', 'False', 1484308659, 1484308659, 105, 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (106, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=AccountMachine,Special=False', 'Query', 'False', 1484308659, 1484308659, 106, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (107, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=AccountMachine,Special=False', 'Modify', 'False', 1484308659, 1484308659, 107, 107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (108, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=AccountMachine,Special=False', 'Delete', 'False', 1484308659, 1484308659, 108, 108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (109, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=AccountMachine,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 109, 109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (110, 'Object', 'Create', 'gold', 'AccountOrganization', NULL, 1, 'Deleted=False,Child=Organization,Special=False,Parent=Account,Association=True', 'Forwarding Account Information', 'False', 1484308659, 1484308659, 110, 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (111, 'Attribute', 'Create', 'gold', 'Account', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Account,Deleted=False,Hidden=False,Object=AccountOrganization,DataType=Integer,Sequence=10', 'Parent Account Id', 'False', 1484308659, 1484308659, 111, 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (112, 'Attribute', 'Create', 'gold', 'Name', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Organization,Deleted=False,Hidden=False,Object=AccountOrganization,DataType=String,Sequence=20', 'Child Organization Name', 'False', 1484308659, 1484308659, 112, 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (113, 'Attribute', 'Create', 'gold', 'User', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=AccountOrganization,DataType=String,Sequence=30', 'Forwarding User', 'False', 1484308659, 1484308659, 113, 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (114, 'Attribute', 'Create', 'gold', 'Project', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=AccountOrganization,DataType=String,Sequence=40', 'Forwarding Project', 'False', 1484308659, 1484308659, 114, 114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (115, 'Attribute', 'Create', 'gold', 'Machine', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=AccountOrganization,DataType=String,Sequence=50', 'Forwarding Machine', 'False', 1484308659, 1484308659, 115, 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (116, 'Attribute', 'Create', 'gold', 'Type', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=AccountOrganization,DataType=String,DefaultValue=Forward,Sequence=60', 'Service Type', 'False', 1484308659, 1484308659, 116, 116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (117, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=False,Deleted=False,Object=AccountOrganization,Special=False', 'Create', 'False', 1484308659, 1484308659, 117, 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (118, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=False,Deleted=False,Object=AccountOrganization,Special=False', 'Query', 'False', 1484308659, 1484308659, 118, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (119, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=False,Deleted=False,Object=AccountOrganization,Special=False', 'Modify', 'False', 1484308659, 1484308659, 119, 119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (120, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=False,Deleted=False,Object=AccountOrganization,Special=False', 'Delete', 'False', 1484308659, 1484308659, 120, 120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (121, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=False,Deleted=False,Object=AccountOrganization,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 121, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (122, 'Object', 'Create', 'gold', 'Allocation', NULL, 1, 'Deleted=False,Association=False,Special=False', 'Allocation', 'False', 1484308659, 1484308659, 122, 122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (123, 'Attribute', 'Create', 'gold', 'Id', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Deleted=False,Hidden=False,Object=Allocation,DataType=AutoGen,Sequence=10', 'Allocation Id', 'False', 1484308659, 1484308659, 123, 123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (124, 'Attribute', 'Create', 'gold', 'Account', NULL, 1, 'Required=True,Special=False,PrimaryKey=False,Fixed=True,Values=@Account,Deleted=False,Hidden=False,Object=Allocation,DataType=Integer,Sequence=20', 'Account Id', 'False', 1484308659, 1484308659, 124, 124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (125, 'Attribute', 'Create', 'gold', 'StartTime', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Allocation,DataType=TimeStamp,DefaultValue=-infinity,Sequence=30', 'Start Time', 'False', 1484308659, 1484308659, 125, 125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (126, 'Attribute', 'Create', 'gold', 'EndTime', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Allocation,DataType=TimeStamp,DefaultValue=infinity,Sequence=40', 'End Time', 'False', 1484308659, 1484308659, 126, 126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (127, 'Attribute', 'Create', 'gold', 'Amount', NULL, 1, 'Required=True,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Allocation,DataType=Currency,Sequence=50', 'Amount', 'False', 1484308659, 1484308659, 127, 127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (128, 'Attribute', 'Create', 'gold', 'CreditLimit', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Allocation,DataType=Currency,DefaultValue=0,Sequence=60', 'Credit Limit', 'False', 1484308659, 1484308659, 128, 128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (129, 'Attribute', 'Create', 'gold', 'Deposited', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Allocation,DataType=Currency,DefaultValue=0,Sequence=70', 'Total Deposited', 'False', 1484308659, 1484308659, 129, 129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (130, 'Attribute', 'Create', 'gold', 'Active', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Allocation,DataType=Boolean,DefaultValue=True,Sequence=80', 'Is the Allocation Active?', 'False', 1484308659, 1484308659, 130, 130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (131, 'Attribute', 'Create', 'gold', 'CallType', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=(Back,Forward,Normal),Deleted=False,Object=Allocation,Hidden=True,DataType=String,DefaultValue=Normal,Sequence=200', 'Call Type', 'False', 1484308659, 1484308659, 131, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (132, 'Attribute', 'Create', 'gold', 'Description', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Allocation,DataType=String,Sequence=900', 'Description', 'False', 1484308659, 1484308659, 132, 132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (133, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=False,Deleted=False,Object=Allocation,Special=False', 'Create', 'False', 1484308659, 1484308659, 133, 133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (134, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=Allocation,Special=False', 'Query', 'False', 1484308659, 1484308659, 134, 134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (135, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=Allocation,Special=False', 'Modify', 'False', 1484308659, 1484308659, 135, 135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (136, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=Allocation,Special=False', 'Delete', 'False', 1484308659, 1484308659, 136, 136, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (137, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=Allocation,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 137, 137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (138, 'Action', 'Create', 'gold', 'Refresh', NULL, 1, 'Display=False,Deleted=False,Object=Allocation,Special=False', 'Refresh', 'False', 1484308659, 1484308659, 138, 138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (139, 'Object', 'Create', 'gold', 'Reservation', NULL, 1, 'Deleted=False,Association=False,Special=False', 'Reservation', 'False', 1484308659, 1484308659, 139, 139, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (140, 'Attribute', 'Create', 'gold', 'Id', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Deleted=False,Hidden=False,Object=Reservation,DataType=AutoGen,Sequence=10', 'Reservation Id', 'False', 1484308659, 1484308659, 140, 140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (141, 'Attribute', 'Create', 'gold', 'Name', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Reservation,DataType=String,Sequence=20', 'Reservation Name', 'False', 1484308659, 1484308659, 141, 141, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (142, 'Attribute', 'Create', 'gold', 'Job', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=@Job,Deleted=False,Hidden=False,Object=Reservation,DataType=String,Sequence=30', 'Gold Job Id', 'False', 1484308659, 1484308659, 142, 142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (143, 'Attribute', 'Create', 'gold', 'User', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=@User,Deleted=False,Hidden=False,Object=Reservation,DataType=String,Sequence=40', 'User Name', 'False', 1484308659, 1484308659, 143, 143, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (144, 'Attribute', 'Create', 'gold', 'Project', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=@Project,Deleted=False,Hidden=False,Object=Reservation,DataType=String,Sequence=50', 'Project Name', 'False', 1484308659, 1484308659, 144, 144, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (145, 'Attribute', 'Create', 'gold', 'Machine', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=@Machine,Deleted=False,Hidden=False,Object=Reservation,DataType=String,Sequence=60', 'Machine Name', 'False', 1484308659, 1484308659, 145, 145, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (146, 'Attribute', 'Create', 'gold', 'StartTime', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Reservation,DataType=TimeStamp,DefaultValue=-infinity,Sequence=70', 'When does this Reservation start?', 'False', 1484308659, 1484308659, 146, 146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (147, 'Attribute', 'Create', 'gold', 'EndTime', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Reservation,DataType=TimeStamp,DefaultValue=infinity,Sequence=80', 'When does this Reservation expire?', 'False', 1484308659, 1484308659, 147, 147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (148, 'Attribute', 'Create', 'gold', 'CallType', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=(Back,Forward,Normal),Deleted=False,Object=Reservation,Hidden=True,DataType=String,DefaultValue=Normal,Sequence=200', 'Call Type', 'False', 1484308659, 1484308659, 148, 148, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (149, 'Attribute', 'Create', 'gold', 'Description', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Reservation,DataType=String,Sequence=900', 'Description', 'False', 1484308659, 1484308659, 149, 149, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (150, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=False,Deleted=False,Object=Reservation,Special=False', 'Create', 'False', 1484308659, 1484308659, 150, 150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (151, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=Reservation,Special=False', 'Query', 'False', 1484308659, 1484308659, 151, 151, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (152, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=Reservation,Special=False', 'Modify', 'False', 1484308659, 1484308659, 152, 152, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (153, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=Reservation,Special=False', 'Delete', 'False', 1484308659, 1484308659, 153, 153, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (154, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=Reservation,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 154, 154, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (155, 'Object', 'Create', 'gold', 'ReservationAllocation', NULL, 1, 'Deleted=False,Child=Allocation,Special=False,Parent=Reservation,Association=True', 'Reservation Allocation Association', 'False', 1484308659, 1484308659, 155, 155, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (156, 'Attribute', 'Create', 'gold', 'Reservation', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Reservation,Deleted=False,Hidden=False,Object=ReservationAllocation,DataType=Integer,Sequence=10', 'Parent Reservation Id', 'False', 1484308659, 1484308659, 156, 156, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (157, 'Attribute', 'Create', 'gold', 'Id', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Allocation,Deleted=False,Hidden=False,Object=ReservationAllocation,DataType=Integer,Sequence=20', 'Child Allocation Id', 'False', 1484308659, 1484308659, 157, 157, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (158, 'Attribute', 'Create', 'gold', 'Account', NULL, 1, 'Required=True,Special=False,PrimaryKey=False,Fixed=False,Values=@Account,Deleted=False,Hidden=False,Object=ReservationAllocation,DataType=Integer,Sequence=30', 'Account Id', 'False', 1484308659, 1484308659, 158, 158, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (159, 'Attribute', 'Create', 'gold', 'Amount', NULL, 1, 'Required=True,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=ReservationAllocation,DataType=Currency,Sequence=40', 'Resource Credits', 'False', 1484308659, 1484308659, 159, 159, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (160, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=False,Deleted=False,Object=ReservationAllocation,Special=False', 'Create', 'False', 1484308659, 1484308659, 160, 160, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (161, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=ReservationAllocation,Special=False', 'Query', 'False', 1484308659, 1484308659, 161, 161, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (162, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=False,Deleted=False,Object=ReservationAllocation,Special=False', 'Modify', 'False', 1484308659, 1484308659, 162, 162, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (163, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=False,Deleted=False,Object=ReservationAllocation,Special=False', 'Delete', 'False', 1484308659, 1484308659, 163, 163, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (164, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=False,Deleted=False,Object=ReservationAllocation,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 164, 164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (165, 'Object', 'Create', 'gold', 'Quotation', NULL, 1, 'Deleted=False,Association=False,Special=False', 'Quotation', 'False', 1484308659, 1484308659, 165, 165, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (166, 'Attribute', 'Create', 'gold', 'Id', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Deleted=False,Hidden=False,Object=Quotation,DataType=AutoGen,Sequence=10', 'Quotation Id', 'False', 1484308659, 1484308659, 166, 166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (167, 'Attribute', 'Create', 'gold', 'Amount', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Quotation,DataType=Currency,Sequence=20', 'Charge Estimate (calculated)', 'False', 1484308659, 1484308659, 167, 167, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (168, 'Attribute', 'Create', 'gold', 'StartTime', NULL, 1, 'Required=True,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Quotation,DataType=TimeStamp,Sequence=30', 'When does this Quotation start?', 'False', 1484308659, 1484308659, 168, 168, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (169, 'Attribute', 'Create', 'gold', 'EndTime', NULL, 1, 'Required=True,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Quotation,DataType=TimeStamp,Sequence=40', 'When does this Quotation expire?', 'False', 1484308659, 1484308659, 169, 169, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (170, 'Attribute', 'Create', 'gold', 'WallDuration', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Quotation,DataType=Integer,Sequence=50', 'WallTime Estimate', 'False', 1484308659, 1484308659, 170, 170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (171, 'Attribute', 'Create', 'gold', 'Job', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=@Job,Deleted=False,Hidden=False,Object=Quotation,DataType=String,Sequence=60', 'Gold Job Id', 'False', 1484308659, 1484308659, 171, 171, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (172, 'Attribute', 'Create', 'gold', 'User', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=@User,Deleted=False,Hidden=False,Object=Quotation,DataType=String,Sequence=70', 'User Name', 'False', 1484308659, 1484308659, 172, 172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (173, 'Attribute', 'Create', 'gold', 'Project', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=@Project,Deleted=False,Hidden=False,Object=Quotation,DataType=String,Sequence=80', 'Project Name', 'False', 1484308659, 1484308659, 173, 173, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (174, 'Attribute', 'Create', 'gold', 'Machine', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=@Machine,Deleted=False,Hidden=False,Object=Quotation,DataType=String,Sequence=90', 'Machine Name', 'False', 1484308659, 1484308659, 174, 174, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (175, 'Attribute', 'Create', 'gold', 'Uses', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Quotation,DataType=Integer,DefaultValue=1,Sequence=100', 'Number of Times Quote can be Used', 'False', 1484308659, 1484308659, 175, 175, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (176, 'Attribute', 'Create', 'gold', 'CallType', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=(Back,Forward,Normal),Deleted=False,Object=Quotation,Hidden=True,DataType=String,DefaultValue=Normal,Sequence=200', 'Call Type', 'False', 1484308659, 1484308659, 176, 176, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (177, 'Attribute', 'Create', 'gold', 'Description', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Quotation,DataType=String,Sequence=900', 'Description', 'False', 1484308659, 1484308659, 177, 177, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (178, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=False,Deleted=False,Object=Quotation,Special=False', 'Create', 'False', 1484308659, 1484308659, 178, 178, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (179, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=Quotation,Special=False', 'Query', 'False', 1484308659, 1484308659, 179, 179, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (180, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=Quotation,Special=False', 'Modify', 'False', 1484308659, 1484308659, 180, 180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (181, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=Quotation,Special=False', 'Delete', 'False', 1484308659, 1484308659, 181, 181, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (182, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=Quotation,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 182, 182, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (183, 'Object', 'Create', 'gold', 'ChargeRate', NULL, 1, 'Deleted=False,Association=False,Special=False', 'Charge Rates', 'False', 1484308659, 1484308659, 183, 183, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (184, 'Attribute', 'Create', 'gold', 'Type', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Deleted=False,Hidden=False,Object=ChargeRate,DataType=String,Sequence=10', 'Charge Rate Type', 'False', 1484308659, 1484308659, 184, 184, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (185, 'Attribute', 'Create', 'gold', 'Name', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Deleted=False,Hidden=False,Object=ChargeRate,DataType=String,Sequence=20', 'Name of Instance of Charge Type', 'False', 1484308659, 1484308659, 185, 185, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (186, 'Attribute', 'Create', 'gold', 'Rate', NULL, 1, 'Required=True,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=ChargeRate,DataType=Float,Sequence=30', 'Charge Rate', 'False', 1484308659, 1484308659, 186, 186, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (187, 'Attribute', 'Create', 'gold', 'Description', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=ChargeRate,DataType=String,Sequence=900', 'Description', 'False', 1484308659, 1484308659, 187, 187, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (188, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=True,Deleted=False,Object=ChargeRate,Special=False', 'Create', 'False', 1484308659, 1484308659, 188, 188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (189, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=ChargeRate,Special=False', 'Query', 'False', 1484308659, 1484308659, 189, 189, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (190, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=ChargeRate,Special=False', 'Modify', 'False', 1484308659, 1484308659, 190, 190, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (191, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=ChargeRate,Special=False', 'Delete', 'False', 1484308659, 1484308659, 191, 191, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (192, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=ChargeRate,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 192, 192, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (193, 'Object', 'Create', 'gold', 'QuotationChargeRate', NULL, 1, 'Deleted=False,Child=ChargeRate,Special=False,Parent=Quotation,Association=True', 'Charge Rate guaranteed by the associated Quotation', 'False', 1484308659, 1484308659, 193, 193, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (194, 'Attribute', 'Create', 'gold', 'Quotation', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Quotation,Deleted=False,Hidden=False,Object=QuotationChargeRate,DataType=Integer,Sequence=10', 'Parent Quotation Id', 'False', 1484308659, 1484308659, 194, 194, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (195, 'Attribute', 'Create', 'gold', 'Type', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Deleted=False,Hidden=False,Object=QuotationChargeRate,DataType=String,Sequence=20', 'Charge Rate Type', 'False', 1484308659, 1484308659, 195, 195, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (196, 'Attribute', 'Create', 'gold', 'Name', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Deleted=False,Hidden=False,Object=QuotationChargeRate,DataType=String,Sequence=30', 'Charge Rate Name', 'False', 1484308659, 1484308659, 196, 196, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (197, 'Attribute', 'Create', 'gold', 'Rate', NULL, 1, 'Required=True,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=QuotationChargeRate,DataType=Float,Sequence=40', 'Charge Rate', 'False', 1484308659, 1484308659, 197, 197, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (198, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=False,Deleted=False,Object=QuotationChargeRate,Special=False', 'Create', 'False', 1484308659, 1484308659, 198, 198, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (199, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=QuotationChargeRate,Special=False', 'Query', 'False', 1484308659, 1484308659, 199, 199, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (200, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=False,Deleted=False,Object=QuotationChargeRate,Special=False', 'Modify', 'False', 1484308659, 1484308659, 200, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (201, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=False,Deleted=False,Object=QuotationChargeRate,Special=False', 'Delete', 'False', 1484308659, 1484308659, 201, 201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (202, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=False,Deleted=False,Object=QuotationChargeRate,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 202, 202, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (203, 'Object', 'Create', 'gold', 'Job', NULL, 1, 'Deleted=False,Association=False,Special=False', 'Job', 'False', 1484308659, 1484308659, 203, 203, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (204, 'Attribute', 'Create', 'gold', 'Id', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Deleted=False,Hidden=False,Object=Job,DataType=AutoGen,Sequence=10', 'Instance Id', 'False', 1484308659, 1484308659, 204, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (205, 'Attribute', 'Create', 'gold', 'JobId', NULL, 1, 'Required=True,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=String,Sequence=20', 'Job Id', 'False', 1484308659, 1484308659, 205, 205, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (206, 'Attribute', 'Create', 'gold', 'User', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=String,Sequence=30', 'User Name', 'False', 1484308659, 1484308659, 206, 206, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (207, 'Attribute', 'Create', 'gold', 'Project', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=String,Sequence=40', 'Project Name', 'False', 1484308659, 1484308659, 207, 207, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (208, 'Attribute', 'Create', 'gold', 'Machine', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=String,Sequence=50', 'Machine Name', 'False', 1484308659, 1484308659, 208, 208, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (209, 'Attribute', 'Create', 'gold', 'Charge', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=Currency,DefaultValue=0,Sequence=60', 'Amount Charged for Job', 'False', 1484308659, 1484308659, 209, 209, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (210, 'Attribute', 'Create', 'gold', 'Queue', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=String,Sequence=70', 'Class or Queue', 'False', 1484308659, 1484308659, 210, 210, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (211, 'Attribute', 'Create', 'gold', 'Type', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=String,Sequence=80', 'Job Type', 'False', 1484308659, 1484308659, 211, 211, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (212, 'Attribute', 'Create', 'gold', 'Stage', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=(Charge,Create,Quote,Reserve),Deleted=False,Hidden=False,Object=Job,DataType=String,Sequence=90', 'Last Job Stage', 'False', 1484308659, 1484308659, 212, 212, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (213, 'Attribute', 'Create', 'gold', 'QualityOfService', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=String,Sequence=100', 'Quality of Service', 'False', 1484308659, 1484308659, 213, 213, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (214, 'Attribute', 'Create', 'gold', 'Nodes', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=Integer,Sequence=110', 'Number of Nodes for the Job', 'False', 1484308659, 1484308659, 214, 214, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (215, 'Attribute', 'Create', 'gold', 'Processors', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=Integer,Sequence=120', 'Number of Processors for the Job', 'False', 1484308659, 1484308659, 215, 215, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (216, 'Attribute', 'Create', 'gold', 'Executable', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=String,Sequence=130', 'Executable', 'False', 1484308659, 1484308659, 216, 216, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (217, 'Attribute', 'Create', 'gold', 'Application', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=(Gaussian,Nwchem),Deleted=False,Hidden=False,Object=Job,DataType=String,Sequence=140', 'Application', 'False', 1484308659, 1484308659, 217, 217, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (218, 'Attribute', 'Create', 'gold', 'StartTime', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=TimeStamp,Sequence=150', 'Start Time', 'False', 1484308659, 1484308659, 218, 218, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (219, 'Attribute', 'Create', 'gold', 'EndTime', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=TimeStamp,Sequence=160', 'Completion Time', 'False', 1484308659, 1484308659, 219, 219, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (220, 'Attribute', 'Create', 'gold', 'WallDuration', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=Integer,Sequence=170', 'Wallclock Time in seconds', 'False', 1484308659, 1484308659, 220, 220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (221, 'Attribute', 'Create', 'gold', 'QuoteId', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=String,Sequence=180', 'Quote Id', 'False', 1484308659, 1484308659, 221, 221, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (222, 'Attribute', 'Create', 'gold', 'CallType', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Values=(Back,Forward,Normal),Deleted=False,Object=Job,Hidden=True,DataType=String,DefaultValue=Normal,Sequence=200', 'Call Type', 'False', 1484308659, 1484308659, 222, 222, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (223, 'Attribute', 'Create', 'gold', 'Description', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=Job,DataType=String,Sequence=900', 'Description', 'False', 1484308659, 1484308659, 223, 223, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (224, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=True,Deleted=False,Object=Job,Special=False', 'Create', 'False', 1484308659, 1484308659, 224, 224, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (225, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=True,Deleted=False,Object=Job,Special=False', 'Query', 'False', 1484308659, 1484308659, 225, 225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (226, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=True,Deleted=False,Object=Job,Special=False', 'Modify', 'False', 1484308659, 1484308659, 226, 226, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (227, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=True,Deleted=False,Object=Job,Special=False', 'Delete', 'False', 1484308659, 1484308659, 227, 227, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (228, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=True,Deleted=False,Object=Job,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 228, 228, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (229, 'Action', 'Create', 'gold', 'Charge', NULL, 1, 'Display=True,Deleted=False,Object=Job,Special=False', 'Charge', 'False', 1484308659, 1484308659, 229, 229, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (230, 'Action', 'Create', 'gold', 'Reserve', NULL, 1, 'Display=True,Deleted=False,Object=Job,Special=False', 'Reserve', 'False', 1484308659, 1484308659, 230, 230, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (231, 'Action', 'Create', 'gold', 'Quote', NULL, 1, 'Display=True,Deleted=False,Object=Job,Special=False', 'Quote', 'False', 1484308659, 1484308659, 231, 231, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (232, 'Action', 'Create', 'gold', 'Refund', NULL, 1, 'Display=True,Deleted=False,Object=Job,Special=False', 'Refund', 'False', 1484308659, 1484308659, 232, 232, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (233, 'Object', 'Create', 'gold', 'AccountAccount', NULL, 1, 'Deleted=False,Child=Account,Special=False,Parent=Account,Association=True', 'Account Deposit Linkage', 'False', 1484308659, 1484308659, 233, 233, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (234, 'Attribute', 'Create', 'gold', 'Account', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Account,Deleted=False,Hidden=False,Object=AccountAccount,DataType=String,Sequence=10', 'Parent Account Id', 'False', 1484308659, 1484308659, 234, 234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (235, 'Attribute', 'Create', 'gold', 'Id', NULL, 1, 'Required=True,Special=False,PrimaryKey=True,Fixed=True,Values=@Account,Deleted=False,Hidden=False,Object=AccountAccount,DataType=String,Sequence=20', 'Child Account Id', 'False', 1484308659, 1484308659, 235, 235, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (236, 'Attribute', 'Create', 'gold', 'DepositShare', NULL, 1, 'Required=True,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=AccountAccount,DataType=Integer,DefaultValue=0,Sequence=30', 'Deposit Share', 'False', 1484308659, 1484308659, 236, 236, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (237, 'Attribute', 'Create', 'gold', 'Overflow', NULL, 1, 'Required=False,Special=False,PrimaryKey=False,Fixed=False,Deleted=False,Hidden=False,Object=AccountAccount,DataType=Boolean,DefaultValue=False,Sequence=40', 'Do descendant charges overflow into this Account?', 'False', 1484308659, 1484308659, 237, 237, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (238, 'Action', 'Create', 'gold', 'Create', NULL, 1, 'Display=False,Deleted=False,Object=AccountAccount,Special=False', 'Create', 'False', 1484308659, 1484308659, 238, 238, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (239, 'Action', 'Create', 'gold', 'Query', NULL, 1, 'Display=False,Deleted=False,Object=AccountAccount,Special=False', 'Query', 'False', 1484308659, 1484308659, 239, 239, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (240, 'Action', 'Create', 'gold', 'Modify', NULL, 1, 'Display=False,Deleted=False,Object=AccountAccount,Special=False', 'Modify', 'False', 1484308659, 1484308659, 240, 240, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (241, 'Action', 'Create', 'gold', 'Delete', NULL, 1, 'Display=False,Deleted=False,Object=AccountAccount,Special=False', 'Delete', 'False', 1484308659, 1484308659, 241, 241, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (242, 'Action', 'Create', 'gold', 'Undelete', NULL, 1, 'Display=False,Deleted=False,Object=AccountAccount,Special=False', 'Undelete', 'False', 1484308659, 1484308659, 242, 242, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (243, 'RoleAction', 'Create', 'gold', 'Anonymous', 'Balance', 1, 'Instance=ANY,Deleted=False,Object=Account', NULL, 'False', 1484308659, 1484308659, 243, 243, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (244, 'Role', 'Create', 'gold', 'ProjectAdmin', NULL, 1, 'Deleted=False', 'Can update or view a project they are admin for', 'False', 1484308659, 1484308659, 244, 244, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (245, 'RoleAction', 'Create', 'gold', 'ProjectAdmin', 'ANY', 1, 'Instance=ADMIN,Deleted=False,Object=Project', NULL, 'False', 1484308659, 1484308659, 245, 245, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (246, 'Role', 'Create', 'gold', 'UserServices', NULL, 1, 'Deleted=False', 'User Services', 'False', 1484308659, 1484308659, 246, 246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (247, 'RoleAction', 'Create', 'gold', 'UserServices', 'Refund', 1, 'Instance=ANY,Deleted=False,Object=Job', NULL, 'False', 1484308659, 1484308659, 247, 247, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (248, 'RoleAction', 'Create', 'gold', 'UserServices', 'ANY', 1, 'Instance=ANY,Deleted=False,Object=User', NULL, 'False', 1484308659, 1484308659, 248, 248, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (249, 'RoleAction', 'Create', 'gold', 'UserServices', 'ANY', 1, 'Instance=ANY,Deleted=False,Object=Machine', NULL, 'False', 1484308659, 1484308659, 249, 249, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (250, 'RoleAction', 'Create', 'gold', 'UserServices', 'ANY', 1, 'Instance=ANY,Deleted=False,Object=Project', NULL, 'False', 1484308659, 1484308659, 250, 250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (251, 'RoleAction', 'Create', 'gold', 'UserServices', 'ANY', 1, 'Instance=ANY,Deleted=False,Object=ProjectUser', NULL, 'False', 1484308659, 1484308659, 251, 251, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (252, 'RoleAction', 'Create', 'gold', 'UserServices', 'ANY', 1, 'Instance=ANY,Deleted=False,Object=ProjectMachine', NULL, 'False', 1484308659, 1484308659, 252, 252, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (253, 'Role', 'Create', 'gold', 'Scheduler', NULL, 1, 'Deleted=False', 'Scheduler relevant Transactions', 'False', 1484308659, 1484308659, 253, 253, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (254, 'RoleAction', 'Create', 'gold', 'Scheduler', 'Charge', 1, 'Instance=ANY,Deleted=False,Object=Job', NULL, 'False', 1484308659, 1484308659, 254, 254, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (255, 'RoleAction', 'Create', 'gold', 'Scheduler', 'Quote', 1, 'Instance=ANY,Deleted=False,Object=Job', NULL, 'False', 1484308659, 1484308659, 255, 255, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (256, 'RoleAction', 'Create', 'gold', 'Scheduler', 'Reserve', 1, 'Instance=ANY,Deleted=False,Object=Job', NULL, 'False', 1484308659, 1484308659, 256, 256, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (257, 'RoleUser', 'Create', 'gold', 'OVERRIDE', 'ANY', 1, 'Deleted=False', NULL, 'False', 1484308659, 1484308659, 257, 257, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (258, 'RoleAction', 'Create', 'gold', 'OVERRIDE', 'Balance', 1, 'Instance=ANY,Deleted=False,Object=Account', NULL, 'False', 1484308659, 1484308659, 258, 258, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (259, 'Project', 'Create', 'gold', 'NONE', NULL, 1, 'Active=False,Special=True', 'No Project', 'False', 1484308659, 1484308659, 260, 259, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (260, 'Project', 'Create', 'gold', 'ADMIN', NULL, 1, 'Active=False,Special=True', 'Any Project which the User is an admin for', 'False', 1484308659, 1484308659, 261, 260, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (261, 'Project', 'Create', 'gold', 'MEMBERS', NULL, 1, 'Active=False,Special=True', 'Any Project the User is a member of', 'False', 1484308659, 1484308659, 262, 261, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (262, 'Project', 'Create', 'gold', 'ANY', NULL, 1, 'Active=False,Special=True', 'Any Project', 'False', 1484308659, 1484308659, 263, 262, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (263, 'User', 'Modify', 'gold', 'gold', NULL, 1, 'Active=True', NULL, 'False', 1484308659, 1484308659, 264, 263, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (264, 'User', 'Modify', 'gold', 'gold', NULL, 3, 'Active=False', NULL, 'False', 1484308659, 1484308659, 265, 264, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (265, 'User', 'Create', 'gold', 'MEMBERS', NULL, 1, 'Deleted=False,Active=False,Special=True', 'Any User which is a member of the Project', 'False', 1484308659, 1484308659, 266, 265, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (266, 'Machine', 'Create', 'gold', 'NONE', NULL, 1, 'Active=False,Special=True', 'No Machine', 'False', 1484308659, 1484308659, 267, 266, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (267, 'Machine', 'Create', 'gold', 'MEMBERS', NULL, 1, 'Active=False,Special=True', 'Any Machine which is a member of the Project', 'False', 1484308659, 1484308659, 268, 267, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (268, 'Machine', 'Create', 'gold', 'ADMIN', NULL, 1, 'Active=False,Special=True', 'Any Machine which the User is an admin for', 'False', 1484308659, 1484308659, 269, 268, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (269, 'Machine', 'Create', 'gold', 'ANY', NULL, 1, 'Active=False,Special=True', 'Any Machine', 'False', 1484308659, 1484308659, 270, 269, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (270, 'ChargeRate', 'Create', 'gold', 'Processors', NULL, 1, 'Type=VBR,Rate=1', NULL, 'False', 1484308659, 1484308659, 271, 270, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_transaction VALUES (271, 'RoleAction', 'Create', 'gold', 'Scheduler', 'Create', 1, 'Instance=ANY,Deleted=False,Object=Job', NULL, 'False', 1484308659, 1484308659, 272, 271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO g_system VALUES ('Gold', '2.2.0.5', 'Beta Release', 'False', 1484308659, 1484308659, 0, 0, NULL);

INSERT INTO g_user VALUES ('gold', 'Gold Admin', 'False', 'False', 1484308659, 1484308659, 264, 263, 'True', NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_user VALUES ('root', 'Moab Admin', 'False', 'False', 1484308659, 1484308659, 264, 263, 'True', NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_user VALUES ('ANY', 'Any User', 'True', 'False', 1484308659, 1484308659, 265, 264, 'False', NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_user VALUES ('NONE', 'No User', 'True', 'False', 1484308659, 1484308659, 265, 264, 'False', NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_user VALUES ('SELF', 'Authenticated User', 'True', 'False', 1484308659, 1484308659, 265, 264, 'False', NULL, NULL, NULL, NULL, NULL);
INSERT INTO g_user VALUES ('MEMBERS', 'Any User which is a member of the Project', 'True', 'False', 1484308659, 1484308659, 266, 265, 'False', NULL, NULL, NULL, NULL, NULL);

INSERT INTO g_role VALUES ('SystemAdmin', 'Can update or view any object', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_role VALUES ('Anonymous', 'Things that can be done by anybody', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_role VALUES ('OVERRIDE', 'A custom authorization method will be invoked', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_role VALUES ('ProjectAdmin', 'Can update or view a project they are admin for', 'False', 1484308659, 1484308659, 244, 244);
INSERT INTO g_role VALUES ('UserServices', 'User Services', 'False', 1484308659, 1484308659, 246, 246);
INSERT INTO g_role VALUES ('Scheduler', 'Scheduler relevant Transactions', 'False', 1484308659, 1484308659, 253, 253);

INSERT INTO g_role_action VALUES ('SystemAdmin', 'ANY', 'ANY', 'ANY', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_role_action VALUES ('Anonymous', 'ANY', 'Query', 'ANY', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_role_action VALUES ('Anonymous', 'Password', 'ANY', 'SELF', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_role_action VALUES ('Anonymous', 'Account', 'Balance', 'ANY', 'False', 1484308659, 1484308659, 243, 243);
INSERT INTO g_role_action VALUES ('ProjectAdmin', 'Project', 'ANY', 'ADMIN', 'False', 1484308659, 1484308659, 245, 245);
INSERT INTO g_role_action VALUES ('UserServices', 'Job', 'Refund', 'ANY', 'False', 1484308659, 1484308659, 247, 247);
INSERT INTO g_role_action VALUES ('UserServices', 'User', 'ANY', 'ANY', 'False', 1484308659, 1484308659, 248, 248);
INSERT INTO g_role_action VALUES ('UserServices', 'Machine', 'ANY', 'ANY', 'False', 1484308659, 1484308659, 249, 249);
INSERT INTO g_role_action VALUES ('UserServices', 'Project', 'ANY', 'ANY', 'False', 1484308659, 1484308659, 250, 250);
INSERT INTO g_role_action VALUES ('UserServices', 'ProjectUser', 'ANY', 'ANY', 'False', 1484308659, 1484308659, 251, 251);
INSERT INTO g_role_action VALUES ('UserServices', 'ProjectMachine', 'ANY', 'ANY', 'False', 1484308659, 1484308659, 252, 252);
INSERT INTO g_role_action VALUES ('Scheduler', 'Job', 'Charge', 'ANY', 'False', 1484308659, 1484308659, 254, 254);
INSERT INTO g_role_action VALUES ('Scheduler', 'Job', 'Quote', 'ANY', 'False', 1484308659, 1484308659, 255, 255);
INSERT INTO g_role_action VALUES ('Scheduler', 'Job', 'Reserve', 'ANY', 'False', 1484308659, 1484308659, 256, 256);
INSERT INTO g_role_action VALUES ('Scheduler', 'Reservation', 'Delete', 'ANY', 'False', 1484308659, 1484308659, 257, 257);
INSERT INTO g_role_action VALUES ('OVERRIDE', 'Account', 'Balance', 'ANY', 'False', 1484308659, 1484308659, 258, 258);
INSERT INTO g_role_action VALUES ('Scheduler', 'Job', 'Create', 'ANY', 'False', 1484308659, 1484308659, 271, 271);

INSERT INTO g_role_user VALUES ('SystemAdmin', 'gold', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_role_user VALUES ('Scheduler', 'root', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_role_user VALUES ('Anonymous', 'ANY', 'False', 1484308659, 1484308659, 0, 0);
INSERT INTO g_role_user VALUES ('OVERRIDE', 'ANY', 'False', 1484308659, 1484308659, 257, 257);

INSERT INTO g_key_generator VALUES ('Account', 1);
INSERT INTO g_key_generator VALUES ('Allocation', 1);
INSERT INTO g_key_generator VALUES ('Reservation', 1);
INSERT INTO g_key_generator VALUES ('Quotation', 1);
INSERT INTO g_key_generator VALUES ('Job', 1);
INSERT INTO g_key_generator VALUES ('Request', 272);
INSERT INTO g_key_generator VALUES ('Transaction', 271);

INSERT INTO g_project VALUES (1484308659, 1484308659, 'False', 260, 259, 'NONE', 'False', NULL, 'True', 'No Project');
INSERT INTO g_project VALUES (1484308659, 1484308659, 'False', 261, 260, 'ADMIN', 'False', NULL, 'True', 'Any Project which the User is an admin for');
INSERT INTO g_project VALUES (1484308659, 1484308659, 'False', 262, 261, 'MEMBERS', 'False', NULL, 'True', 'Any Project the User is a member of');
INSERT INTO g_project VALUES (1484308659, 1484308659, 'False', 263, 262, 'ANY', 'False', NULL, 'True', 'Any Project');

INSERT INTO g_machine VALUES (1484308659, 1484308659, 'False', 267, 266, 'NONE', 'False', NULL, NULL, NULL, 'True', 'No Machine');
INSERT INTO g_machine VALUES (1484308659, 1484308659, 'False', 268, 267, 'MEMBERS', 'False', NULL, NULL, NULL, 'True', 'Any Machine which is a member of the Project');
INSERT INTO g_machine VALUES (1484308659, 1484308659, 'False', 269, 268, 'ADMIN', 'False', NULL, NULL, NULL, 'True', 'Any Machine which the User is an admin for');
INSERT INTO g_machine VALUES (1484308659, 1484308659, 'False', 270, 269, 'ANY', 'False', NULL, NULL, NULL, 'True', 'Any Machine');

INSERT INTO g_charge_rate VALUES (1484308659, 1484308659, 'False', 271, 270, 'VBR', 'Processors', '', 1, NULL);
