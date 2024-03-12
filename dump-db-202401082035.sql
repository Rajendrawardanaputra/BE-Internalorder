toc.dat                                                                                             0000600 0004000 0002000 00000170037 14546775010 0014460 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       #                 |            db    16.1    16.1 �    {           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         |           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         }           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         ~           1262    24589    db    DATABASE     }   CREATE DATABASE db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE db;
                postgres    false                     2615    24590    internal_order    SCHEMA        CREATE SCHEMA internal_order;
    DROP SCHEMA internal_order;
                pg_database_owner    false                    0    0    SCHEMA internal_order    COMMENT     >   COMMENT ON SCHEMA internal_order IS 'standard public schema';
                   pg_database_owner    false    5                     2615    24591    project_charter    SCHEMA        CREATE SCHEMA project_charter;
    DROP SCHEMA project_charter;
                postgres    false         k           1247    24593    action_activity    TYPE     b   CREATE TYPE internal_order.action_activity AS ENUM (
    'added',
    'deleted',
    'changed'
);
 *   DROP TYPE internal_order.action_activity;
       internal_order          postgres    false    5         n           1247    24600    project_status    TYPE     c   CREATE TYPE internal_order.project_status AS ENUM (
    'ON_GOING',
    'FINISH',
    'DROPPED'
);
 )   DROP TYPE internal_order.project_status;
       internal_order          postgres    false    5         q           1247    24608    role    TYPE     E   CREATE TYPE internal_order.role AS ENUM (
    'admin',
    'user'
);
    DROP TYPE internal_order.role;
       internal_order          postgres    false    5         t           1247    24614    roles    TYPE     �  CREATE TYPE internal_order.roles AS ENUM (
    'PM/Scrum Master',
    'Senior Business Analyst',
    'Product Owner',
    'UI UX designer',
    'Senior Programmer Backend',
    'Senior Programmer FrontEnd',
    'Mobile Developer',
    'Design Grafis',
    'FullStack Developer',
    'DBA',
    'DevOps',
    'Business Analyst',
    'Junior Programmer Backend',
    'Junior Programmer FrontEnd',
    'Technical Writer',
    'Tester'
);
     DROP TYPE internal_order.roles;
       internal_order          postgres    false    5         w           1247    24648    status_project    TYPE     P   CREATE TYPE project_charter.status_project AS ENUM (
    'draft',
    'done'
);
 *   DROP TYPE project_charter.status_project;
       project_charter          postgres    false    6         �            1255    24653    generate_sequence()    FUNCTION     �  CREATE FUNCTION internal_order.generate_sequence() RETURNS text
    LANGUAGE plpgsql
    AS $$
declare 
	year_part text ;
	month_part text;
	sequence_part text;
begin
	month_part := to_char(current_date, 'MM');
	year_part := right(extract (year from current_date)::text, 2); 
	sequence_part := LPAD (NEXTVAL('"internal order".sequ_number'):: text ,3, '0');
	
return CONCAT (sequence_part, '/IO/JSC/', month_part,year_part);

end;
$$;
 2   DROP FUNCTION internal_order.generate_sequence();
       internal_order          postgres    false    5         �            1255    24654    generate_sequence_number()    FUNCTION     �   CREATE FUNCTION internal_order.generate_sequence_number() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
   NEW.sequence_number = LPAD(NEW.id_project::VARCHAR, 3, '0') || '/IO/JSC/' || TO_CHAR(CURRENT_DATE, 'MMYY');
   RETURN NEW;
END;
$$;
 9   DROP FUNCTION internal_order.generate_sequence_number();
       internal_order          postgres    false    5         �            1259    24656    activity_log    TABLE     A  CREATE TABLE internal_order.activity_log (
    id_activity_log integer NOT NULL,
    detail_activity character varying(255),
    action_activity internal_order.action_activity,
    id_user integer,
    timestampz timestamp without time zone,
    id_project integer,
    id_role integer,
    id_detail_timeline integer
);
 (   DROP TABLE internal_order.activity_log;
       internal_order         heap    postgres    false    875    5         �            1259    24659     activity_log_id_activity_log_seq    SEQUENCE     �   CREATE SEQUENCE internal_order.activity_log_id_activity_log_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE internal_order.activity_log_id_activity_log_seq;
       internal_order          postgres    false    5    216         �           0    0     activity_log_id_activity_log_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE internal_order.activity_log_id_activity_log_seq OWNED BY internal_order.activity_log.id_activity_log;
          internal_order          postgres    false    217         �            1259    24660    detail_main_power    TABLE     �   CREATE TABLE internal_order.detail_main_power (
    id_role integer NOT NULL,
    man_days_rate integer,
    man_power integer,
    days integer,
    role internal_order.roles,
    total_man_rate integer,
    id_user integer,
    id_project integer
);
 -   DROP TABLE internal_order.detail_main_power;
       internal_order         heap    postgres    false    884    5         �            1259    24663    detail_main_power_id_role_seq    SEQUENCE     �   CREATE SEQUENCE internal_order.detail_main_power_id_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE internal_order.detail_main_power_id_role_seq;
       internal_order          postgres    false    218    5         �           0    0    detail_main_power_id_role_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE internal_order.detail_main_power_id_role_seq OWNED BY internal_order.detail_main_power.id_role;
          internal_order          postgres    false    219         �            1259    24664    detail_timeline    TABLE       CREATE TABLE internal_order.detail_timeline (
    id_detail_timeline integer NOT NULL,
    weeks integer,
    activity character varying(255),
    "createdAt" timestamp with time zone,
    "updateAt" timestamp with time zone,
    id_user integer,
    id_project integer
);
 +   DROP TABLE internal_order.detail_timeline;
       internal_order         heap    postgres    false    5         �            1259    24667 &   detail_timeline_id_detail_timeline_seq    SEQUENCE     �   CREATE SEQUENCE internal_order.detail_timeline_id_detail_timeline_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE internal_order.detail_timeline_id_detail_timeline_seq;
       internal_order          postgres    false    220    5         �           0    0 &   detail_timeline_id_detail_timeline_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE internal_order.detail_timeline_id_detail_timeline_seq OWNED BY internal_order.detail_timeline.id_detail_timeline;
          internal_order          postgres    false    221         �            1259    24668    nomor_sequence    SEQUENCE     �   CREATE SEQUENCE internal_order.nomor_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1;
 -   DROP SEQUENCE internal_order.nomor_sequence;
       internal_order          postgres    false    5         �            1259    24669    project_internal    TABLE     �  CREATE TABLE internal_order.project_internal (
    id_project integer NOT NULL,
    requester character varying(100),
    application_name character varying(100),
    start_date date NOT NULL,
    end_date date NOT NULL,
    status internal_order.project_status,
    hld character varying(255),
    lld character varying(255),
    brd character varying(255),
    sequence_number character varying(20),
    id_user integer,
    "createdAt" timestamp with time zone,
    "updateAt" timestamp with time zone
);
 ,   DROP TABLE internal_order.project_internal;
       internal_order         heap    postgres    false    878    5         �            1259    24674    project_internal_id_project_seq    SEQUENCE     �   CREATE SEQUENCE internal_order.project_internal_id_project_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE internal_order.project_internal_id_project_seq;
       internal_order          postgres    false    223    5         �           0    0    project_internal_id_project_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE internal_order.project_internal_id_project_seq OWNED BY internal_order.project_internal.id_project;
          internal_order          postgres    false    224         �            1259    24675    sequ_number    SEQUENCE     |   CREATE SEQUENCE internal_order.sequ_number
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE internal_order.sequ_number;
       internal_order          postgres    false    5         �            1259    24676    sequence_number    SEQUENCE     �   CREATE SEQUENCE internal_order.sequence_number
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1;
 .   DROP SEQUENCE internal_order.sequence_number;
       internal_order          postgres    false    5         �            1259    24677    user    TABLE     B  CREATE TABLE internal_order."user" (
    id_user integer NOT NULL,
    password character varying(255) NOT NULL,
    hak_akses internal_order.role,
    nama character varying(255),
    email character varying(255),
    phone character varying(15),
    jabatan character varying(255),
    profile character varying(255)
);
 "   DROP TABLE internal_order."user";
       internal_order         heap    postgres    false    5    881         �            1259    24682    user_id_user_seq    SEQUENCE     �   CREATE SEQUENCE internal_order.user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE internal_order.user_id_user_seq;
       internal_order          postgres    false    5    227         �           0    0    user_id_user_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE internal_order.user_id_user_seq OWNED BY internal_order."user".id_user;
          internal_order          postgres    false    228         �            1259    24683 
   approvedBy    TABLE       CREATE TABLE project_charter."approvedBy" (
    nama character varying(255),
    cc_to character varying(255),
    tanggal date,
    id_approv integer NOT NULL,
    note character varying(255),
    title character varying(255),
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_approvedby project_charter.status_project,
    nama1 character varying(255),
    title1 character varying(255),
    cc_to1 character varying(255),
    tanggal1 date
);
 )   DROP TABLE project_charter."approvedBy";
       project_charter         heap    postgres    false    6    887         �            1259    24688    approvedBy_id_approv_seq    SEQUENCE     �   CREATE SEQUENCE project_charter."approvedBy_id_approv_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE project_charter."approvedBy_id_approv_seq";
       project_charter          postgres    false    6    229         �           0    0    approvedBy_id_approv_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE project_charter."approvedBy_id_approv_seq" OWNED BY project_charter."approvedBy".id_approv;
          project_charter          postgres    false    230         �            1259    24689    deliverable    TABLE     3  CREATE TABLE project_charter.deliverable (
    id_deliverable integer NOT NULL,
    deliverables character varying(255),
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_deliverable project_charter.status_project
);
 (   DROP TABLE project_charter.deliverable;
       project_charter         heap    postgres    false    887    6         �            1259    24692    deliverable_id_deliverable_seq    SEQUENCE     �   CREATE SEQUENCE project_charter.deliverable_id_deliverable_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE project_charter.deliverable_id_deliverable_seq;
       project_charter          postgres    false    6    231         �           0    0    deliverable_id_deliverable_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE project_charter.deliverable_id_deliverable_seq OWNED BY project_charter.deliverable.id_deliverable;
          project_charter          postgres    false    232         �            1259    24693    description    TABLE     �  CREATE TABLE project_charter.description (
    hlr character varying(255),
    assumptions character varying(255),
    contraints character varying(255),
    risk character varying(255),
    key_stakeholders character varying(255),
    id_description integer NOT NULL,
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_description project_charter.status_project
);
 (   DROP TABLE project_charter.description;
       project_charter         heap    postgres    false    6    887         �            1259    24696    description_id_description_seq    SEQUENCE     �   CREATE SEQUENCE project_charter.description_id_description_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE project_charter.description_id_description_seq;
       project_charter          postgres    false    6    233         �           0    0    description_id_description_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE project_charter.description_id_description_seq OWNED BY project_charter.description.id_description;
          project_charter          postgres    false    234         �            1259    24707    detail_responsibilities    TABLE     �  CREATE TABLE project_charter.detail_responsibilities (
    id_detail_roleresponsibilities integer NOT NULL,
    id_responsibilities integer,
    nama_pc character varying(255),
    role_pc character varying(255),
    description character varying(255),
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_detailresponsibilities project_charter.status_project
);
 4   DROP TABLE project_charter.detail_responsibilities;
       project_charter         heap    postgres    false    887    6         �            1259    24712 :   detail_responsibilities_id_detail_roleresponsibilities_seq    SEQUENCE     �   CREATE SEQUENCE project_charter.detail_responsibilities_id_detail_roleresponsibilities_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 Z   DROP SEQUENCE project_charter.detail_responsibilities_id_detail_roleresponsibilities_seq;
       project_charter          postgres    false    6    235         �           0    0 :   detail_responsibilities_id_detail_roleresponsibilities_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE project_charter.detail_responsibilities_id_detail_roleresponsibilities_seq OWNED BY project_charter.detail_responsibilities.id_detail_roleresponsibilities;
          project_charter          postgres    false    236         �            1259    24719 
   milostones    TABLE     t  CREATE TABLE project_charter.milostones (
    milestone character varying(50),
    deskripsi character varying(50),
    id_milostone integer NOT NULL,
    tanggal character varying(255),
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_milostones project_charter.status_project
);
 '   DROP TABLE project_charter.milostones;
       project_charter         heap    postgres    false    6    887         �            1259    24722    milostones_id_milostone_seq    SEQUENCE     �   CREATE SEQUENCE project_charter.milostones_id_milostone_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE project_charter.milostones_id_milostone_seq;
       project_charter          postgres    false    237    6         �           0    0    milostones_id_milostone_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE project_charter.milostones_id_milostone_seq OWNED BY project_charter.milostones.id_milostone;
          project_charter          postgres    false    238         �            1259    24723    project_charter    TABLE     �  CREATE TABLE project_charter.project_charter (
    project_name character varying,
    project_manager character varying,
    customer character varying,
    end_customer character varying,
    bu_delivery character varying,
    bu_related character varying,
    id_charter integer NOT NULL,
    project_description character varying(255),
    "createdAt" timestamp without time zone,
    id_user integer,
    "updateAt" timestamp with time zone,
    status_project project_charter.status_project
);
 ,   DROP TABLE project_charter.project_charter;
       project_charter         heap    postgres    false    887    6         �            1259    24728    project_charter_id_project_seq    SEQUENCE     �   CREATE SEQUENCE project_charter.project_charter_id_project_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE project_charter.project_charter_id_project_seq;
       project_charter          postgres    false    239    6         �           0    0    project_charter_id_project_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE project_charter.project_charter_id_project_seq OWNED BY project_charter.project_charter.id_charter;
          project_charter          postgres    false    240         �            1259    24729    responsibility    TABLE     �  CREATE TABLE project_charter.responsibility (
    pm_responsibility character varying(255),
    project_value character varying(255),
    start_date date,
    end_date date,
    id_responsibility integer NOT NULL,
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_responsibility project_charter.status_project
);
 +   DROP TABLE project_charter.responsibility;
       project_charter         heap    postgres    false    887    6         �            1259    24734 $   responsibility_id_responsibility_seq    SEQUENCE     �   CREATE SEQUENCE project_charter.responsibility_id_responsibility_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE project_charter.responsibility_id_responsibility_seq;
       project_charter          postgres    false    241    6         �           0    0 $   responsibility_id_responsibility_seq    SEQUENCE OWNED BY        ALTER SEQUENCE project_charter.responsibility_id_responsibility_seq OWNED BY project_charter.responsibility.id_responsibility;
          project_charter          postgres    false    242         �            1259    24735    role_responsibilities    TABLE     N  CREATE TABLE project_charter.role_responsibilities (
    struktur_organisasi character varying(255),
    id_responsibilities integer NOT NULL,
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_responsibilities project_charter.status_project
);
 2   DROP TABLE project_charter.role_responsibilities;
       project_charter         heap    postgres    false    6    887         �            1259    24738 -   role_responsibilities_id_responsibilities_seq    SEQUENCE     �   CREATE SEQUENCE project_charter.role_responsibilities_id_responsibilities_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE project_charter.role_responsibilities_id_responsibilities_seq;
       project_charter          postgres    false    6    243         �           0    0 -   role_responsibilities_id_responsibilities_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE project_charter.role_responsibilities_id_responsibilities_seq OWNED BY project_charter.role_responsibilities.id_responsibilities;
          project_charter          postgres    false    244         �            1259    57370    status    TABLE     {  CREATE TABLE project_charter.status (
    id_status integer NOT NULL,
    status project_charter.status_project,
    id_description integer,
    id_deliverable integer,
    id_milostone integer,
    id_responsibilities integer,
    id_responsibility integer,
    id_supporting integer,
    id_approv integer,
    id_charter integer,
    id_detail_roleresponsibilities integer
);
 #   DROP TABLE project_charter.status;
       project_charter         heap    postgres    false    6    887         �            1259    57369    status_id_status_seq    SEQUENCE     �   CREATE SEQUENCE project_charter.status_id_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE project_charter.status_id_status_seq;
       project_charter          postgres    false    248    6         �           0    0    status_id_status_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE project_charter.status_id_status_seq OWNED BY project_charter.status.id_status;
          project_charter          postgres    false    247         �            1259    24739    supporting_doc    TABLE       CREATE TABLE project_charter.supporting_doc (
    document_name character varying(255),
    notes character varying(255),
    document character varying(255),
    id_supporting integer NOT NULL,
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_supportingdoc project_charter.status_project
);
 +   DROP TABLE project_charter.supporting_doc;
       project_charter         heap    postgres    false    887    6         �            1259    24744     supporting_doc_id_supporting_seq    SEQUENCE     �   CREATE SEQUENCE project_charter.supporting_doc_id_supporting_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE project_charter.supporting_doc_id_supporting_seq;
       project_charter          postgres    false    6    245         �           0    0     supporting_doc_id_supporting_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE project_charter.supporting_doc_id_supporting_seq OWNED BY project_charter.supporting_doc.id_supporting;
          project_charter          postgres    false    246         u           2604    24745    activity_log id_activity_log    DEFAULT     �   ALTER TABLE ONLY internal_order.activity_log ALTER COLUMN id_activity_log SET DEFAULT nextval('internal_order.activity_log_id_activity_log_seq'::regclass);
 S   ALTER TABLE internal_order.activity_log ALTER COLUMN id_activity_log DROP DEFAULT;
       internal_order          postgres    false    217    216         v           2604    24746    detail_main_power id_role    DEFAULT     �   ALTER TABLE ONLY internal_order.detail_main_power ALTER COLUMN id_role SET DEFAULT nextval('internal_order.detail_main_power_id_role_seq'::regclass);
 P   ALTER TABLE internal_order.detail_main_power ALTER COLUMN id_role DROP DEFAULT;
       internal_order          postgres    false    219    218         w           2604    24747 "   detail_timeline id_detail_timeline    DEFAULT     �   ALTER TABLE ONLY internal_order.detail_timeline ALTER COLUMN id_detail_timeline SET DEFAULT nextval('internal_order.detail_timeline_id_detail_timeline_seq'::regclass);
 Y   ALTER TABLE internal_order.detail_timeline ALTER COLUMN id_detail_timeline DROP DEFAULT;
       internal_order          postgres    false    221    220         x           2604    24748    project_internal id_project    DEFAULT     �   ALTER TABLE ONLY internal_order.project_internal ALTER COLUMN id_project SET DEFAULT nextval('internal_order.project_internal_id_project_seq'::regclass);
 R   ALTER TABLE internal_order.project_internal ALTER COLUMN id_project DROP DEFAULT;
       internal_order          postgres    false    224    223         y           2604    24749    user id_user    DEFAULT     ~   ALTER TABLE ONLY internal_order."user" ALTER COLUMN id_user SET DEFAULT nextval('internal_order.user_id_user_seq'::regclass);
 E   ALTER TABLE internal_order."user" ALTER COLUMN id_user DROP DEFAULT;
       internal_order          postgres    false    228    227         z           2604    24750    approvedBy id_approv    DEFAULT     �   ALTER TABLE ONLY project_charter."approvedBy" ALTER COLUMN id_approv SET DEFAULT nextval('project_charter."approvedBy_id_approv_seq"'::regclass);
 N   ALTER TABLE project_charter."approvedBy" ALTER COLUMN id_approv DROP DEFAULT;
       project_charter          postgres    false    230    229         {           2604    24751    deliverable id_deliverable    DEFAULT     �   ALTER TABLE ONLY project_charter.deliverable ALTER COLUMN id_deliverable SET DEFAULT nextval('project_charter.deliverable_id_deliverable_seq'::regclass);
 R   ALTER TABLE project_charter.deliverable ALTER COLUMN id_deliverable DROP DEFAULT;
       project_charter          postgres    false    232    231         |           2604    24752    description id_description    DEFAULT     �   ALTER TABLE ONLY project_charter.description ALTER COLUMN id_description SET DEFAULT nextval('project_charter.description_id_description_seq'::regclass);
 R   ALTER TABLE project_charter.description ALTER COLUMN id_description DROP DEFAULT;
       project_charter          postgres    false    234    233         }           2604    24755 6   detail_responsibilities id_detail_roleresponsibilities    DEFAULT     �   ALTER TABLE ONLY project_charter.detail_responsibilities ALTER COLUMN id_detail_roleresponsibilities SET DEFAULT nextval('project_charter.detail_responsibilities_id_detail_roleresponsibilities_seq'::regclass);
 n   ALTER TABLE project_charter.detail_responsibilities ALTER COLUMN id_detail_roleresponsibilities DROP DEFAULT;
       project_charter          postgres    false    236    235         ~           2604    24757    milostones id_milostone    DEFAULT     �   ALTER TABLE ONLY project_charter.milostones ALTER COLUMN id_milostone SET DEFAULT nextval('project_charter.milostones_id_milostone_seq'::regclass);
 O   ALTER TABLE project_charter.milostones ALTER COLUMN id_milostone DROP DEFAULT;
       project_charter          postgres    false    238    237                    2604    24758    project_charter id_charter    DEFAULT     �   ALTER TABLE ONLY project_charter.project_charter ALTER COLUMN id_charter SET DEFAULT nextval('project_charter.project_charter_id_project_seq'::regclass);
 R   ALTER TABLE project_charter.project_charter ALTER COLUMN id_charter DROP DEFAULT;
       project_charter          postgres    false    240    239         �           2604    24759     responsibility id_responsibility    DEFAULT     �   ALTER TABLE ONLY project_charter.responsibility ALTER COLUMN id_responsibility SET DEFAULT nextval('project_charter.responsibility_id_responsibility_seq'::regclass);
 X   ALTER TABLE project_charter.responsibility ALTER COLUMN id_responsibility DROP DEFAULT;
       project_charter          postgres    false    242    241         �           2604    24760 )   role_responsibilities id_responsibilities    DEFAULT     �   ALTER TABLE ONLY project_charter.role_responsibilities ALTER COLUMN id_responsibilities SET DEFAULT nextval('project_charter.role_responsibilities_id_responsibilities_seq'::regclass);
 a   ALTER TABLE project_charter.role_responsibilities ALTER COLUMN id_responsibilities DROP DEFAULT;
       project_charter          postgres    false    244    243         �           2604    57373    status id_status    DEFAULT     �   ALTER TABLE ONLY project_charter.status ALTER COLUMN id_status SET DEFAULT nextval('project_charter.status_id_status_seq'::regclass);
 H   ALTER TABLE project_charter.status ALTER COLUMN id_status DROP DEFAULT;
       project_charter          postgres    false    247    248    248         �           2604    24761    supporting_doc id_supporting    DEFAULT     �   ALTER TABLE ONLY project_charter.supporting_doc ALTER COLUMN id_supporting SET DEFAULT nextval('project_charter.supporting_doc_id_supporting_seq'::regclass);
 T   ALTER TABLE project_charter.supporting_doc ALTER COLUMN id_supporting DROP DEFAULT;
       project_charter          postgres    false    246    245         X          0    24656    activity_log 
   TABLE DATA           �   COPY internal_order.activity_log (id_activity_log, detail_activity, action_activity, id_user, timestampz, id_project, id_role, id_detail_timeline) FROM stdin;
    internal_order          postgres    false    216       4952.dat Z          0    24660    detail_main_power 
   TABLE DATA           �   COPY internal_order.detail_main_power (id_role, man_days_rate, man_power, days, role, total_man_rate, id_user, id_project) FROM stdin;
    internal_order          postgres    false    218       4954.dat \          0    24664    detail_timeline 
   TABLE DATA           �   COPY internal_order.detail_timeline (id_detail_timeline, weeks, activity, "createdAt", "updateAt", id_user, id_project) FROM stdin;
    internal_order          postgres    false    220       4956.dat _          0    24669    project_internal 
   TABLE DATA           �   COPY internal_order.project_internal (id_project, requester, application_name, start_date, end_date, status, hld, lld, brd, sequence_number, id_user, "createdAt", "updateAt") FROM stdin;
    internal_order          postgres    false    223       4959.dat c          0    24677    user 
   TABLE DATA           l   COPY internal_order."user" (id_user, password, hak_akses, nama, email, phone, jabatan, profile) FROM stdin;
    internal_order          postgres    false    227       4963.dat e          0    24683 
   approvedBy 
   TABLE DATA           �   COPY project_charter."approvedBy" (nama, cc_to, tanggal, id_approv, note, title, id_charter, id_user, "updatedAt", "createdAt", status_approvedby, nama1, title1, cc_to1, tanggal1) FROM stdin;
    project_charter          postgres    false    229       4965.dat g          0    24689    deliverable 
   TABLE DATA           �   COPY project_charter.deliverable (id_deliverable, deliverables, id_charter, id_user, "updatedAt", "createdAt", status_deliverable) FROM stdin;
    project_charter          postgres    false    231       4967.dat i          0    24693    description 
   TABLE DATA           �   COPY project_charter.description (hlr, assumptions, contraints, risk, key_stakeholders, id_description, id_charter, id_user, "updatedAt", "createdAt", status_description) FROM stdin;
    project_charter          postgres    false    233       4969.dat k          0    24707    detail_responsibilities 
   TABLE DATA           �   COPY project_charter.detail_responsibilities (id_detail_roleresponsibilities, id_responsibilities, nama_pc, role_pc, description, id_charter, id_user, "updatedAt", "createdAt", status_detailresponsibilities) FROM stdin;
    project_charter          postgres    false    235       4971.dat m          0    24719 
   milostones 
   TABLE DATA           �   COPY project_charter.milostones (milestone, deskripsi, id_milostone, tanggal, id_charter, id_user, "updatedAt", "createdAt", status_milostones) FROM stdin;
    project_charter          postgres    false    237       4973.dat o          0    24723    project_charter 
   TABLE DATA           �   COPY project_charter.project_charter (project_name, project_manager, customer, end_customer, bu_delivery, bu_related, id_charter, project_description, "createdAt", id_user, "updateAt", status_project) FROM stdin;
    project_charter          postgres    false    239       4975.dat q          0    24729    responsibility 
   TABLE DATA           �   COPY project_charter.responsibility (pm_responsibility, project_value, start_date, end_date, id_responsibility, id_charter, id_user, "updatedAt", "createdAt", status_responsibility) FROM stdin;
    project_charter          postgres    false    241       4977.dat s          0    24735    role_responsibilities 
   TABLE DATA           �   COPY project_charter.role_responsibilities (struktur_organisasi, id_responsibilities, id_charter, id_user, "updatedAt", "createdAt", status_responsibilities) FROM stdin;
    project_charter          postgres    false    243       4979.dat x          0    57370    status 
   TABLE DATA           �   COPY project_charter.status (id_status, status, id_description, id_deliverable, id_milostone, id_responsibilities, id_responsibility, id_supporting, id_approv, id_charter, id_detail_roleresponsibilities) FROM stdin;
    project_charter          postgres    false    248       4984.dat u          0    24739    supporting_doc 
   TABLE DATA           �   COPY project_charter.supporting_doc (document_name, notes, document, id_supporting, id_charter, id_user, "updatedAt", "createdAt", status_supportingdoc) FROM stdin;
    project_charter          postgres    false    245       4981.dat �           0    0     activity_log_id_activity_log_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('internal_order.activity_log_id_activity_log_seq', 1, true);
          internal_order          postgres    false    217         �           0    0    detail_main_power_id_role_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('internal_order.detail_main_power_id_role_seq', 186, true);
          internal_order          postgres    false    219         �           0    0 &   detail_timeline_id_detail_timeline_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('internal_order.detail_timeline_id_detail_timeline_seq', 162, true);
          internal_order          postgres    false    221         �           0    0    nomor_sequence    SEQUENCE SET     E   SELECT pg_catalog.setval('internal_order.nomor_sequence', 1, false);
          internal_order          postgres    false    222         �           0    0    project_internal_id_project_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('internal_order.project_internal_id_project_seq', 140, true);
          internal_order          postgres    false    224         �           0    0    sequ_number    SEQUENCE SET     A   SELECT pg_catalog.setval('internal_order.sequ_number', 3, true);
          internal_order          postgres    false    225         �           0    0    sequence_number    SEQUENCE SET     E   SELECT pg_catalog.setval('internal_order.sequence_number', 1, true);
          internal_order          postgres    false    226         �           0    0    user_id_user_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('internal_order.user_id_user_seq', 134, true);
          internal_order          postgres    false    228         �           0    0    approvedBy_id_approv_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('project_charter."approvedBy_id_approv_seq"', 40, true);
          project_charter          postgres    false    230         �           0    0    deliverable_id_deliverable_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('project_charter.deliverable_id_deliverable_seq', 76, true);
          project_charter          postgres    false    232         �           0    0    description_id_description_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('project_charter.description_id_description_seq', 45, true);
          project_charter          postgres    false    234         �           0    0 :   detail_responsibilities_id_detail_roleresponsibilities_seq    SEQUENCE SET     r   SELECT pg_catalog.setval('project_charter.detail_responsibilities_id_detail_roleresponsibilities_seq', 23, true);
          project_charter          postgres    false    236         �           0    0    milostones_id_milostone_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('project_charter.milostones_id_milostone_seq', 61, true);
          project_charter          postgres    false    238         �           0    0    project_charter_id_project_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('project_charter.project_charter_id_project_seq', 176, true);
          project_charter          postgres    false    240         �           0    0 $   responsibility_id_responsibility_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('project_charter.responsibility_id_responsibility_seq', 13, true);
          project_charter          postgres    false    242         �           0    0 -   role_responsibilities_id_responsibilities_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('project_charter.role_responsibilities_id_responsibilities_seq', 10, true);
          project_charter          postgres    false    244         �           0    0    status_id_status_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('project_charter.status_id_status_seq', 1, false);
          project_charter          postgres    false    247         �           0    0     supporting_doc_id_supporting_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('project_charter.supporting_doc_id_supporting_seq', 6, true);
          project_charter          postgres    false    246         �           2606    24763    activity_log activity_log_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY internal_order.activity_log
    ADD CONSTRAINT activity_log_pkey PRIMARY KEY (id_activity_log);
 P   ALTER TABLE ONLY internal_order.activity_log DROP CONSTRAINT activity_log_pkey;
       internal_order            postgres    false    216         �           2606    24765 (   detail_main_power detail_main_power_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY internal_order.detail_main_power
    ADD CONSTRAINT detail_main_power_pkey PRIMARY KEY (id_role);
 Z   ALTER TABLE ONLY internal_order.detail_main_power DROP CONSTRAINT detail_main_power_pkey;
       internal_order            postgres    false    218         �           2606    24767 $   detail_timeline detail_timeline_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY internal_order.detail_timeline
    ADD CONSTRAINT detail_timeline_pkey PRIMARY KEY (id_detail_timeline);
 V   ALTER TABLE ONLY internal_order.detail_timeline DROP CONSTRAINT detail_timeline_pkey;
       internal_order            postgres    false    220         �           2606    24769 &   project_internal project_internal_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY internal_order.project_internal
    ADD CONSTRAINT project_internal_pkey PRIMARY KEY (id_project);
 X   ALTER TABLE ONLY internal_order.project_internal DROP CONSTRAINT project_internal_pkey;
       internal_order            postgres    false    223         �           2606    24771    user user_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY internal_order."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);
 G   ALTER TABLE ONLY internal_order."user" DROP CONSTRAINT user_email_key;
       internal_order            postgres    false    227         �           2606    24773    user user_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY internal_order."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);
 B   ALTER TABLE ONLY internal_order."user" DROP CONSTRAINT user_pkey;
       internal_order            postgres    false    227         �           2606    24775    approvedBy approvedBy_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY project_charter."approvedBy"
    ADD CONSTRAINT "approvedBy_pkey" PRIMARY KEY (id_approv);
 Q   ALTER TABLE ONLY project_charter."approvedBy" DROP CONSTRAINT "approvedBy_pkey";
       project_charter            postgres    false    229         �           2606    24777    deliverable deliverable_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY project_charter.deliverable
    ADD CONSTRAINT deliverable_pkey PRIMARY KEY (id_deliverable);
 O   ALTER TABLE ONLY project_charter.deliverable DROP CONSTRAINT deliverable_pkey;
       project_charter            postgres    false    231         �           2606    24779    description description_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY project_charter.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (id_description);
 O   ALTER TABLE ONLY project_charter.description DROP CONSTRAINT description_pkey;
       project_charter            postgres    false    233         �           2606    24785 4   detail_responsibilities detail_responsibilities_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY project_charter.detail_responsibilities
    ADD CONSTRAINT detail_responsibilities_pkey PRIMARY KEY (id_detail_roleresponsibilities);
 g   ALTER TABLE ONLY project_charter.detail_responsibilities DROP CONSTRAINT detail_responsibilities_pkey;
       project_charter            postgres    false    235         �           2606    24789    milostones milostones_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY project_charter.milostones
    ADD CONSTRAINT milostones_pkey PRIMARY KEY (id_milostone);
 M   ALTER TABLE ONLY project_charter.milostones DROP CONSTRAINT milostones_pkey;
       project_charter            postgres    false    237         �           2606    24791 $   project_charter project_charter_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY project_charter.project_charter
    ADD CONSTRAINT project_charter_pkey PRIMARY KEY (id_charter);
 W   ALTER TABLE ONLY project_charter.project_charter DROP CONSTRAINT project_charter_pkey;
       project_charter            postgres    false    239         �           2606    24793 "   responsibility responsibility_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY project_charter.responsibility
    ADD CONSTRAINT responsibility_pkey PRIMARY KEY (id_responsibility);
 U   ALTER TABLE ONLY project_charter.responsibility DROP CONSTRAINT responsibility_pkey;
       project_charter            postgres    false    241         �           2606    24795 0   role_responsibilities role_responsibilities_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY project_charter.role_responsibilities
    ADD CONSTRAINT role_responsibilities_pkey PRIMARY KEY (id_responsibilities);
 c   ALTER TABLE ONLY project_charter.role_responsibilities DROP CONSTRAINT role_responsibilities_pkey;
       project_charter            postgres    false    243         �           2606    57375    status status_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id_status);
 E   ALTER TABLE ONLY project_charter.status DROP CONSTRAINT status_pkey;
       project_charter            postgres    false    248         �           2606    24797 "   supporting_doc supporting_doc_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY project_charter.supporting_doc
    ADD CONSTRAINT supporting_doc_pkey PRIMARY KEY (id_supporting);
 U   ALTER TABLE ONLY project_charter.supporting_doc DROP CONSTRAINT supporting_doc_pkey;
       project_charter            postgres    false    245         �           2620    24798 (   project_internal sequence_number_trigger    TRIGGER     �   CREATE TRIGGER sequence_number_trigger BEFORE INSERT OR UPDATE ON internal_order.project_internal FOR EACH ROW EXECUTE FUNCTION internal_order.generate_sequence_number();
 I   DROP TRIGGER sequence_number_trigger ON internal_order.project_internal;
       internal_order          postgres    false    250    223         �           2606    24800 "   activity_log fk_id_detail_timeline    FK CONSTRAINT     �   ALTER TABLE ONLY internal_order.activity_log
    ADD CONSTRAINT fk_id_detail_timeline FOREIGN KEY (id_detail_timeline) REFERENCES internal_order.detail_timeline(id_detail_timeline);
 T   ALTER TABLE ONLY internal_order.activity_log DROP CONSTRAINT fk_id_detail_timeline;
       internal_order          postgres    false    4745    220    216         �           2606    24805    detail_main_power fk_id_projecr    FK CONSTRAINT     �   ALTER TABLE ONLY internal_order.detail_main_power
    ADD CONSTRAINT fk_id_projecr FOREIGN KEY (id_project) REFERENCES internal_order.project_internal(id_project);
 Q   ALTER TABLE ONLY internal_order.detail_main_power DROP CONSTRAINT fk_id_projecr;
       internal_order          postgres    false    4747    223    218         �           2606    24810    activity_log fk_id_project    FK CONSTRAINT     �   ALTER TABLE ONLY internal_order.activity_log
    ADD CONSTRAINT fk_id_project FOREIGN KEY (id_project) REFERENCES internal_order.project_internal(id_project);
 L   ALTER TABLE ONLY internal_order.activity_log DROP CONSTRAINT fk_id_project;
       internal_order          postgres    false    216    223    4747         �           2606    24815    detail_timeline fk_id_project    FK CONSTRAINT     �   ALTER TABLE ONLY internal_order.detail_timeline
    ADD CONSTRAINT fk_id_project FOREIGN KEY (id_project) REFERENCES internal_order.project_internal(id_project);
 O   ALTER TABLE ONLY internal_order.detail_timeline DROP CONSTRAINT fk_id_project;
       internal_order          postgres    false    223    4747    220         �           2606    24820    activity_log fk_id_role    FK CONSTRAINT     �   ALTER TABLE ONLY internal_order.activity_log
    ADD CONSTRAINT fk_id_role FOREIGN KEY (id_role) REFERENCES internal_order.detail_main_power(id_role);
 I   ALTER TABLE ONLY internal_order.activity_log DROP CONSTRAINT fk_id_role;
       internal_order          postgres    false    4743    218    216         �           2606    24825    activity_log fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY internal_order.activity_log
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);
 I   ALTER TABLE ONLY internal_order.activity_log DROP CONSTRAINT fk_id_user;
       internal_order          postgres    false    4751    227    216         �           2606    24830    detail_timeline fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY internal_order.detail_timeline
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);
 L   ALTER TABLE ONLY internal_order.detail_timeline DROP CONSTRAINT fk_id_user;
       internal_order          postgres    false    4751    227    220         �           2606    24835    project_internal fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY internal_order.project_internal
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);
 M   ALTER TABLE ONLY internal_order.project_internal DROP CONSTRAINT fk_id_user;
       internal_order          postgres    false    4751    223    227         �           2606    24840    detail_main_power fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY internal_order.detail_main_power
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);
 N   ALTER TABLE ONLY internal_order.detail_main_power DROP CONSTRAINT fk_id_user;
       internal_order          postgres    false    227    4751    218         �           2606    57416    status fk_id_approv    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_approv FOREIGN KEY (id_approv) REFERENCES project_charter."approvedBy"(id_approv);
 F   ALTER TABLE ONLY project_charter.status DROP CONSTRAINT fk_id_approv;
       project_charter          postgres    false    4753    229    248         �           2606    41018    approvedBy fk_id_charter    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter."approvedBy"
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);
 M   ALTER TABLE ONLY project_charter."approvedBy" DROP CONSTRAINT fk_id_charter;
       project_charter          postgres    false    229    4763    239         �           2606    41023    deliverable fk_id_charter    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.deliverable
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);
 L   ALTER TABLE ONLY project_charter.deliverable DROP CONSTRAINT fk_id_charter;
       project_charter          postgres    false    231    239    4763         �           2606    41028    description fk_id_charter    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.description
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);
 L   ALTER TABLE ONLY project_charter.description DROP CONSTRAINT fk_id_charter;
       project_charter          postgres    false    239    4763    233         �           2606    41033 %   detail_responsibilities fk_id_charter    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.detail_responsibilities
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);
 X   ALTER TABLE ONLY project_charter.detail_responsibilities DROP CONSTRAINT fk_id_charter;
       project_charter          postgres    false    4763    239    235         �           2606    41038    milostones fk_id_charter    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.milostones
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);
 K   ALTER TABLE ONLY project_charter.milostones DROP CONSTRAINT fk_id_charter;
       project_charter          postgres    false    239    4763    237         �           2606    41043    responsibility fk_id_charter    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.responsibility
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);
 O   ALTER TABLE ONLY project_charter.responsibility DROP CONSTRAINT fk_id_charter;
       project_charter          postgres    false    241    239    4763         �           2606    41048 #   role_responsibilities fk_id_charter    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.role_responsibilities
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);
 V   ALTER TABLE ONLY project_charter.role_responsibilities DROP CONSTRAINT fk_id_charter;
       project_charter          postgres    false    239    243    4763         �           2606    41053    supporting_doc fk_id_charter    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.supporting_doc
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);
 O   ALTER TABLE ONLY project_charter.supporting_doc DROP CONSTRAINT fk_id_charter;
       project_charter          postgres    false    245    4763    239         �           2606    57381    status fk_id_charter    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);
 G   ALTER TABLE ONLY project_charter.status DROP CONSTRAINT fk_id_charter;
       project_charter          postgres    false    4763    239    248         �           2606    57386    status fk_id_deliverable    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_deliverable FOREIGN KEY (id_deliverable) REFERENCES project_charter.deliverable(id_deliverable);
 K   ALTER TABLE ONLY project_charter.status DROP CONSTRAINT fk_id_deliverable;
       project_charter          postgres    false    231    248    4755         �           2606    57401 (   status fk_id_detail_roleresponsibilities    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_detail_roleresponsibilities FOREIGN KEY (id_detail_roleresponsibilities) REFERENCES project_charter.detail_responsibilities(id_detail_roleresponsibilities);
 [   ALTER TABLE ONLY project_charter.status DROP CONSTRAINT fk_id_detail_roleresponsibilities;
       project_charter          postgres    false    4759    248    235         �           2606    57391    status fk_id_milostone    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_milostone FOREIGN KEY (id_milostone) REFERENCES project_charter.milostones(id_milostone);
 I   ALTER TABLE ONLY project_charter.status DROP CONSTRAINT fk_id_milostone;
       project_charter          postgres    false    4761    248    237         �           2606    24855 .   detail_responsibilities fk_id_responsibilities    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.detail_responsibilities
    ADD CONSTRAINT fk_id_responsibilities FOREIGN KEY (id_responsibilities) REFERENCES project_charter.role_responsibilities(id_responsibilities);
 a   ALTER TABLE ONLY project_charter.detail_responsibilities DROP CONSTRAINT fk_id_responsibilities;
       project_charter          postgres    false    243    4767    235         �           2606    57396    status fk_id_responsibilities    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_responsibilities FOREIGN KEY (id_responsibilities) REFERENCES project_charter.role_responsibilities(id_responsibilities);
 P   ALTER TABLE ONLY project_charter.status DROP CONSTRAINT fk_id_responsibilities;
       project_charter          postgres    false    243    248    4767         �           2606    57406    status fk_id_responsibility    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_responsibility FOREIGN KEY (id_responsibility) REFERENCES project_charter.responsibility(id_responsibility);
 N   ALTER TABLE ONLY project_charter.status DROP CONSTRAINT fk_id_responsibility;
       project_charter          postgres    false    241    4765    248         �           2606    57411    status fk_id_supporting    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_supporting FOREIGN KEY (id_supporting) REFERENCES project_charter.supporting_doc(id_supporting);
 J   ALTER TABLE ONLY project_charter.status DROP CONSTRAINT fk_id_supporting;
       project_charter          postgres    false    4769    248    245         �           2606    40973    project_charter fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.project_charter
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);
 M   ALTER TABLE ONLY project_charter.project_charter DROP CONSTRAINT fk_id_user;
       project_charter          postgres    false    4751    227    239         �           2606    40978    approvedBy fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter."approvedBy"
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);
 J   ALTER TABLE ONLY project_charter."approvedBy" DROP CONSTRAINT fk_id_user;
       project_charter          postgres    false    4751    229    227         �           2606    40983    deliverable fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.deliverable
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);
 I   ALTER TABLE ONLY project_charter.deliverable DROP CONSTRAINT fk_id_user;
       project_charter          postgres    false    4751    227    231         �           2606    40988    description fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.description
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);
 I   ALTER TABLE ONLY project_charter.description DROP CONSTRAINT fk_id_user;
       project_charter          postgres    false    4751    227    233         �           2606    40993 "   detail_responsibilities fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.detail_responsibilities
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);
 U   ALTER TABLE ONLY project_charter.detail_responsibilities DROP CONSTRAINT fk_id_user;
       project_charter          postgres    false    4751    227    235         �           2606    40998    milostones fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.milostones
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);
 H   ALTER TABLE ONLY project_charter.milostones DROP CONSTRAINT fk_id_user;
       project_charter          postgres    false    237    227    4751         �           2606    41003    responsibility fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.responsibility
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);
 L   ALTER TABLE ONLY project_charter.responsibility DROP CONSTRAINT fk_id_user;
       project_charter          postgres    false    4751    227    241         �           2606    41008     role_responsibilities fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.role_responsibilities
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);
 S   ALTER TABLE ONLY project_charter.role_responsibilities DROP CONSTRAINT fk_id_user;
       project_charter          postgres    false    4751    227    243         �           2606    41013    supporting_doc fk_id_user    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.supporting_doc
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);
 L   ALTER TABLE ONLY project_charter.supporting_doc DROP CONSTRAINT fk_id_user;
       project_charter          postgres    false    227    245    4751         �           2606    57376    status fk_status_id_description    FK CONSTRAINT     �   ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_status_id_description FOREIGN KEY (id_description) REFERENCES project_charter.description(id_description);
 R   ALTER TABLE ONLY project_charter.status DROP CONSTRAINT fk_status_id_description;
       project_charter          postgres    false    233    248    4757                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         4952.dat                                                                                            0000600 0004000 0002000 00000000041 14546775010 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	\N	changed	\N	\N	\N	\N	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               4954.dat                                                                                            0000600 0004000 0002000 00000000353 14546775010 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        183	70000	3	7	Tester	1470000	121	113
184	80000	1	3	Junior Programmer Backend	240000	121	113
185	80000	3	9	Senior Programmer FrontEnd	2160000	121	113
186	90000	6	8	Design Grafis	4320000	121	113
182	53000	9	9	Tester	4293000	121	113
\.


                                                                                                                                                                                                                                                                                     4956.dat                                                                                            0000600 0004000 0002000 00000014755 14546775010 0014306 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        81	3	sapi	2024-01-03 14:39:04.779744+07	2024-01-03 15:09:54.391779+07	121	113
80	2	kambing	2024-01-03 14:39:04.776743+07	2024-01-03 15:10:07.827774+07	121	113
87	4		2024-01-03 15:13:33.981741+07	2024-01-03 15:13:33.981741+07	\N	\N
88	5		2024-01-03 15:13:33.98274+07	2024-01-03 15:13:33.98274+07	\N	\N
89	1		2024-01-03 15:13:36.776486+07	2024-01-03 15:13:36.776486+07	\N	\N
90	2		2024-01-03 15:13:36.781487+07	2024-01-03 15:13:36.781487+07	\N	\N
91	3		2024-01-03 15:13:36.783488+07	2024-01-03 15:13:36.783488+07	\N	\N
92	4		2024-01-03 15:13:36.785488+07	2024-01-03 15:13:36.785488+07	\N	\N
93	5		2024-01-03 15:13:36.78749+07	2024-01-03 15:13:36.78749+07	\N	\N
78	3	jerapah	2024-01-03 14:33:39.700227+07	2024-01-03 15:22:49.55359+07	121	113
94	1	hai	2024-01-03 15:24:29.774252+07	2024-01-03 15:24:29.774252+07	\N	\N
95	2	hallo	2024-01-03 15:24:29.784261+07	2024-01-03 15:24:29.784261+07	\N	\N
96	3	hai	2024-01-03 15:24:29.786256+07	2024-01-03 15:24:29.786256+07	\N	\N
97	4	Jendra	2024-01-03 15:24:29.788359+07	2024-01-03 15:24:29.789258+07	\N	\N
98	5	mancing	2024-01-03 15:24:29.792262+07	2024-01-03 15:24:29.792262+07	\N	\N
84	1	kou	2024-01-03 15:13:33.972739+07	2024-01-03 15:39:45.905363+07	\N	\N
99	1	tidur	2024-01-03 22:44:26.268593+07	2024-01-03 22:44:26.268593+07	121	113
100	2	bangun	2024-01-03 22:44:26.285709+07	2024-01-03 22:44:26.285709+07	121	113
101	1	hai	2024-01-03 22:56:15.641882+07	2024-01-03 22:56:15.641882+07	\N	\N
102	2	mumet	2024-01-03 22:56:15.649882+07	2024-01-03 22:56:15.649882+07	\N	\N
103	1	mancing	2024-01-03 23:02:50.700286+07	2024-01-03 23:02:50.700286+07	122	\N
104	2	mumet	2024-01-03 23:02:50.708395+07	2024-01-03 23:02:50.708395+07	122	\N
105	1	hai	2024-01-03 23:15:14.542212+07	2024-01-03 23:15:14.542212+07	122	\N
106	1	mumet	2024-01-03 23:45:41.587583+07	2024-01-03 23:45:41.587583+07	122	130
107	1	mumet	2024-01-03 23:46:17.726166+07	2024-01-03 23:46:17.727167+07	122	130
108	1	mumet	2024-01-04 09:27:36.879028+07	2024-01-04 09:27:36.879028+07	122	131
79	1	tidurinn	2024-01-03 14:39:04.768763+07	2024-01-04 10:46:01.160815+07	121	113
82	1	tidurann	2024-01-03 14:39:30.50714+07	2024-01-04 10:46:38.6471+07	121	113
85	2	jilo	2024-01-03 15:13:33.977738+07	2024-01-04 13:14:42.730944+07	\N	\N
109	1		2024-01-04 13:47:27.729937+07	2024-01-04 13:47:27.729937+07	122	131
110	2		2024-01-04 13:47:27.737938+07	2024-01-04 13:47:27.737938+07	122	131
111	1		2024-01-04 13:47:57.821322+07	2024-01-04 13:47:57.821322+07	122	131
112	1		2024-01-04 13:48:20.119521+07	2024-01-04 13:48:20.119521+07	122	131
113	1	ngeseng	2024-01-04 13:51:26.796947+07	2024-01-04 13:51:26.796947+07	122	131
114	2		2024-01-04 13:51:26.803946+07	2024-01-04 13:51:26.804949+07	122	131
115	3		2024-01-04 13:51:26.806949+07	2024-01-04 13:51:26.806949+07	122	131
116	4		2024-01-04 13:51:26.808954+07	2024-01-04 13:51:26.808954+07	122	131
117	5		2024-01-04 13:51:26.81095+07	2024-01-04 13:51:26.81095+07	122	131
118	1		2024-01-04 13:52:53.36385+07	2024-01-04 13:52:53.36385+07	122	131
119	2		2024-01-04 13:52:53.369848+07	2024-01-04 13:52:53.369848+07	122	131
120	3		2024-01-04 13:52:53.371846+07	2024-01-04 13:52:53.371846+07	122	131
121	1		2024-01-04 13:52:56.277183+07	2024-01-04 13:52:56.277183+07	122	131
122	2		2024-01-04 13:52:56.283182+07	2024-01-04 13:52:56.283182+07	122	131
123	3		2024-01-04 13:52:56.285182+07	2024-01-04 13:52:56.285182+07	122	131
124	1		2024-01-04 13:53:29.938138+07	2024-01-04 13:53:29.938138+07	122	131
125	2		2024-01-04 13:53:29.946136+07	2024-01-04 13:53:29.946136+07	122	131
126	3		2024-01-04 13:53:29.949142+07	2024-01-04 13:53:29.949142+07	122	131
127	1		2024-01-04 13:54:08.262013+07	2024-01-04 13:54:08.262013+07	122	131
128	2		2024-01-04 13:54:08.269013+07	2024-01-04 13:54:08.269013+07	122	131
129	3		2024-01-04 13:54:08.271012+07	2024-01-04 13:54:08.271012+07	122	131
130	4		2024-01-04 13:54:08.273016+07	2024-01-04 13:54:08.273016+07	122	131
131	5		2024-01-04 13:54:08.276017+07	2024-01-04 13:54:08.276017+07	122	131
132	6		2024-01-04 13:54:08.277012+07	2024-01-04 13:54:08.277012+07	122	131
133	1		2024-01-04 13:55:12.239865+07	2024-01-04 13:55:12.239865+07	122	131
134	2		2024-01-04 13:55:12.248004+07	2024-01-04 13:55:12.248004+07	122	131
135	3		2024-01-04 13:55:12.249863+07	2024-01-04 13:55:12.249863+07	122	131
136	1		2024-01-04 13:55:14.124044+07	2024-01-04 13:55:14.124044+07	122	131
137	2		2024-01-04 13:55:14.130043+07	2024-01-04 13:55:14.130043+07	122	131
138	3		2024-01-04 13:55:14.132043+07	2024-01-04 13:55:14.132043+07	122	131
139	1		2024-01-04 13:56:59.482196+07	2024-01-04 13:56:59.482196+07	122	131
140	2		2024-01-04 13:56:59.488195+07	2024-01-04 13:56:59.488195+07	122	131
141	3		2024-01-04 13:56:59.490195+07	2024-01-04 13:56:59.490195+07	122	131
142	4		2024-01-04 13:56:59.492262+07	2024-01-04 13:56:59.492262+07	122	131
143	5		2024-01-04 13:56:59.495197+07	2024-01-04 13:56:59.495197+07	122	131
144	6		2024-01-04 13:56:59.497198+07	2024-01-04 13:56:59.497198+07	122	131
145	1		2024-01-04 13:57:54.646847+07	2024-01-04 13:57:54.646847+07	122	131
146	2		2024-01-04 13:57:54.652848+07	2024-01-04 13:57:54.652848+07	122	131
76	1	tidur	2024-01-03 14:33:39.68822+07	2024-01-03 14:33:39.68822+07	121	113
77	2	bangun	2024-01-03 14:33:39.697223+07	2024-01-03 14:33:39.697223+07	121	113
147	3		2024-01-04 13:57:54.655848+07	2024-01-04 13:57:54.655848+07	122	131
148	4		2024-01-04 13:57:54.657849+07	2024-01-04 13:57:54.657849+07	122	131
149	5		2024-01-04 13:57:54.658849+07	2024-01-04 13:57:54.658849+07	122	131
150	6		2024-01-04 13:57:54.661849+07	2024-01-04 13:57:54.661849+07	122	131
83	2	bangunani	2024-01-03 14:39:30.515172+07	2024-01-04 15:17:07.221351+07	121	113
151	1		2024-01-04 17:22:58.267369+07	2024-01-04 17:22:58.267369+07	122	131
152	2		2024-01-04 17:22:58.274369+07	2024-01-04 17:22:58.274369+07	122	131
153	3		2024-01-04 17:22:58.277487+07	2024-01-04 17:22:58.277487+07	122	131
154	1		2024-01-04 17:23:36.949576+07	2024-01-04 17:23:36.949576+07	122	131
155	1		2024-01-04 17:23:54.755211+07	2024-01-04 17:23:54.755211+07	122	131
86	3	minum	2024-01-03 15:13:33.979739+07	2024-01-05 14:51:36.880921+07	\N	\N
156	1	tidur	2024-01-08 14:01:04.428336+07	2024-01-08 14:01:04.428336+07	121	113
157	1	tidur	2024-01-08 14:04:06.141798+07	2024-01-08 14:04:06.141798+07	121	113
158	1	tidur	2024-01-08 14:17:15.850058+07	2024-01-08 14:17:15.850058+07	121	113
159	1	tidur	2024-01-08 14:45:41.560407+07	2024-01-08 14:45:41.560407+07	121	113
160	1	tidur	2024-01-08 14:49:56.990774+07	2024-01-08 14:49:56.990774+07	121	113
161	1	tidur	2024-01-08 15:27:36.829303+07	2024-01-08 15:27:36.829303+07	121	113
162	2	bangun	2024-01-08 15:27:36.839305+07	2024-01-08 15:27:36.839305+07	121	113
\.


                   4959.dat                                                                                            0000600 0004000 0002000 00000026765 14546775010 0014315 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        99	Jendra	uiux game	2023-03-30	2023-08-30	ON_GOING	/internalorder/hld/20231229155809_Screenshot 2023-11-27 231210.png	/internalorder/lld/20231229155809_WhatsApp Image 2023-10-02 at 08.33.07_f309cefe.jpg	https://drive.google.com/file/d/1vhA3VjLiEkYJkV6r5BmYp792BbepyL2P/view?usp=drive_link	099/IO/JSC/1223	122	2023-12-29 15:58:09.978131+07	2023-12-29 15:58:09.978131+07
124	Haikal	Taman Siswa	2024-01-03	2024-02-03	ON_GOING	/internalorder/hld/20240103233242_01476162115siapkan cafe.jpeg	/internalorder/lld/20240103233242_78001-angkat-beban.jpg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	124/IO/JSC/0124	\N	2024-01-03 23:32:42.987608+07	2024-01-03 23:32:42.987608+07
125	Haikal	Taman Siswa	2024-01-03	2024-01-17	ON_GOING	/internalorder/hld/20240103233351_01476162115siapkan cafe.jpeg	/internalorder/lld/20240103233351_78001-angkat-beban.jpg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	125/IO/JSC/0124	\N	2024-01-03 23:33:51.793514+07	2024-01-03 23:33:51.793514+07
103	Haikal	Taman Siswa Game	2024-02-22	2024-05-05	FINISH	/internalorder/hld/20240102101518_football.PNG	/internalorder/lld/20240102101518_Screenshot 2023-09-26 160947.png	https://www.figma.com/file/3u8OTfLpxQLpJ65EwStibt/Internal-order-project?type=design&node-id=253-2817&mode=design&t=LKthFhGTVv20Wqf9-0	103/IO/JSC/0124	121	2023-12-30 21:34:38.495047+07	2024-01-02 10:15:18.643187+07
104	Saiful	TambalBan Online	2024-01-01	2024-05-01	ON_GOING	/internalorder/hld/20240102142537_americano.jpeg	/internalorder/lld/20240102142537_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	104/IO/JSC/0124	\N	2024-01-02 14:25:40.211728+07	2024-01-02 14:25:40.211728+07
105	Supri	Telolet	2024-01-01	2024-02-01	ON_GOING	/internalorder/hld/20240102143301_americano.jpeg	/internalorder/lld/20240102143301_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	105/IO/JSC/0124	\N	2024-01-02 14:33:02.774369+07	2024-01-02 14:33:02.774369+07
106	Supri	Telolet	2024-01-01	2024-02-01	ON_GOING	/internalorder/hld/20240102143318_americano.jpeg	/internalorder/lld/20240102143318_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	106/IO/JSC/0124	\N	2024-01-02 14:33:18.263899+07	2024-01-02 14:33:18.263899+07
107	Jendrot	prot prot	2024-01-01	2024-02-01	ON_GOING	/internalorder/hld/20240102150500_americano.jpeg	/internalorder/lld/20240102150500_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	107/IO/JSC/0124	\N	2024-01-02 15:05:01.070877+07	2024-01-02 15:05:01.070877+07
108	Haikal	Taman Siswa	2024-01-01	2024-02-01	ON_GOING	/internalorder/hld/20240102151331_americano.jpeg	/internalorder/lld/20240102151331_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	108/IO/JSC/0124	\N	2024-01-02 15:13:33.26372+07	2024-01-02 15:13:33.26372+07
109	Haikal	Taman Siswa	2024-01-01	2024-02-01	ON_GOING	/internalorder/hld/20240102151745_americano.jpeg	/internalorder/lld/20240102151745_01476162115siapkan cafe.jpeg		109/IO/JSC/0124	\N	2024-01-02 15:17:46.065275+07	2024-01-02 15:17:46.065275+07
110	Haikal	Taman Siswa	2024-01-01	2024-02-01	ON_GOING	/internalorder/hld/20240102151758_americano.jpeg	/internalorder/lld/20240102151758_01476162115siapkan cafe.jpeg		110/IO/JSC/0124	\N	2024-01-02 15:17:59.13927+07	2024-01-02 15:17:59.13927+07
111	Haikal	Taman Siswa	2024-01-01	2024-02-01	ON_GOING	/internalorder/hld/20240102162700_americano.jpeg	/internalorder/lld/20240102162700_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	111/IO/JSC/0124	\N	2024-01-02 16:27:02.063185+07	2024-01-02 16:27:02.063185+07
112	Haikal	Taman Siswa	2024-01-01	2024-02-01	ON_GOING	/internalorder/hld/20240102162817_americano.jpeg	/internalorder/lld/20240102162817_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	112/IO/JSC/0124	\N	2024-01-02 16:28:17.263546+07	2024-01-02 16:28:17.263546+07
113	Haikal	Taman Siswa	2024-01-01	2024-02-01	DROPPED	/internalorder/hld/20240102163400_americano.jpeg	/internalorder/lld/20240102163400_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	113/IO/JSC/0124	\N	2024-01-02 16:34:00.48801+07	2024-01-02 16:34:00.48801+07
114	Haikal	Taman Siswa	2024-01-01	2024-02-01	ON_GOING	/internalorder/hld/20240102190000_americano.jpeg	/internalorder/lld/20240102190000_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	114/IO/JSC/0124	\N	2024-01-02 19:00:02.36664+07	2024-01-02 19:00:02.36664+07
115	Haikal	Taman Siswa	2024-01-01	2024-02-01	DROPPED	/internalorder/hld/20240102191926_americano.jpeg	/internalorder/lld/20240102191926_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	115/IO/JSC/0124	\N	2024-01-02 19:19:28.192893+07	2024-01-02 19:19:28.192893+07
116	Haikal	Telolet	2024-01-01	2024-02-01	ON_GOING	/internalorder/hld/20240103092402_americano.jpeg	/internalorder/lld/20240103092402_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	116/IO/JSC/0124	\N	2024-01-03 09:24:04.866799+07	2024-01-03 09:24:04.866799+07
117	Haikal	Telolet	2024-01-01	2024-02-01	DROPPED	/internalorder/hld/20240103092911_americano.jpeg	/internalorder/lld/20240103092911_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	117/IO/JSC/0124	\N	2024-01-03 09:29:11.371518+07	2024-01-03 09:29:11.371518+07
118	Haikal	Telolet	2024-01-01	2024-02-01	FINISH	/internalorder/hld/20240103111834_americano.jpeg	/internalorder/lld/20240103111834_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	118/IO/JSC/0124	\N	2024-01-03 11:18:36.382621+07	2024-01-03 11:18:36.382621+07
126	Haikal	Taman Siswa	2024-01-01	2024-01-07	ON_GOING	/internalorder/hld/20240103233525_americano.jpeg	/internalorder/lld/20240103233525_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	126/IO/JSC/0124	\N	2024-01-03 23:35:25.535825+07	2024-01-03 23:35:25.535825+07
119	Haikal	Taman Siswa	2024-01-01	2024-01-14	FINISH	/internalorder/hld/20240103214919_americano.jpeg	/internalorder/lld/20240103214919_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	119/IO/JSC/0124	\N	2024-01-03 21:49:21.115919+07	2024-01-03 21:49:21.115919+07
120	Haikal	Telolet	2024-01-01	2024-01-07	FINISH	/internalorder/hld/20240103230649_americano.jpeg	/internalorder/lld/20240103230649_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	120/IO/JSC/0124	\N	2024-01-03 23:06:50.898042+07	2024-01-03 23:06:50.898042+07
121	Jendra	AyeAye	2024-01-01	2024-07-01	DROPPED	/internalorder/hld/20240103230925_americano.jpeg	/internalorder/lld/20240103230925_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	121/IO/JSC/0124	\N	2024-01-03 23:09:25.813431+07	2024-01-03 23:09:25.813431+07
122	Supri	shopee	2024-01-01	2024-07-01	FINISH	/internalorder/hld/20240103231237_americano.jpeg	/internalorder/lld/20240103231237_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	122/IO/JSC/0124	\N	2024-01-03 23:12:38.122834+07	2024-01-03 23:12:38.122834+07
123	Haikal	Taman Siswa	2024-01-01	2024-01-07	FINISH	/internalorder/hld/20240103231804_americano.jpeg	/internalorder/lld/20240103231804_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	123/IO/JSC/0124	\N	2024-01-03 23:18:04.788239+07	2024-01-03 23:18:04.788239+07
127	debi	shopee	2024-01-01	2024-01-07	DROPPED	/internalorder/hld/20240103233806_americano.jpeg	/internalorder/lld/20240103233806_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	127/IO/JSC/0124	\N	2024-01-03 23:38:06.185238+07	2024-01-03 23:38:06.185238+07
128	k	n	2024-01-01	2024-01-07	ON_GOING	/internalorder/hld/20240103234030_americano.jpeg	/internalorder/lld/20240103234030_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	128/IO/JSC/0124	\N	2024-01-03 23:40:30.362639+07	2024-01-03 23:40:30.362639+07
129	k	g	2024-01-01	2024-01-07	ON_GOING	/internalorder/hld/20240103234138_americano.jpeg	/internalorder/lld/20240103234138_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	129/IO/JSC/0124	\N	2024-01-03 23:41:38.771164+07	2024-01-03 23:41:38.771164+07
130	k	k	2024-01-01	2024-01-07	DROPPED	/internalorder/hld/20240103234532_americano.jpeg	/internalorder/lld/20240103234532_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	130/IO/JSC/0124	\N	2024-01-03 23:45:33.028056+07	2024-01-03 23:45:33.028056+07
131	jidan	ignite	2024-01-01	2024-01-07	DROPPED	/internalorder/hld/20240103234940_americano.jpeg	/internalorder/lld/20240103234940_01476162115siapkan cafe.jpeg	https://chat.openai.com/c/85ea2e71-0326-4839-ad4d-dde72c6c5fd4	131/IO/JSC/0124	122	2024-01-03 23:49:41.476638+07	2024-01-03 23:49:41.476638+07
132	haikal	testing	2024-02-22	2024-05-22	ON_GOING	/internalorder/hld/20240108115154_Screenshot 2023-09-01 013352.png	/internalorder/lld/20240108115154_Screenshot 2023-09-30 080509.png		132/IO/JSC/0124	134	2024-01-08 11:51:54.955431+07	2024-01-08 11:51:54.955431+07
133	haikal	testing	2024-02-22	2024-05-22	ON_GOING	/internalorder/hld/20240108115251_Screenshot 2023-09-01 013352.png	/internalorder/lld/20240108115251_Screenshot 2023-09-30 080509.png		133/IO/JSC/0124	134	2024-01-08 11:52:52.665902+07	2024-01-08 11:52:52.665902+07
135	haikal	testing	2024-02-22	2024-05-22	ON_GOING	/internalorder/hld/20240108115549_Screenshot 2023-09-01 013352.png	/internalorder/lld/20240108115549_Screenshot 2023-09-30 080509.png		135/IO/JSC/0124	134	2024-01-08 11:55:51.126527+07	2024-01-08 11:55:51.126527+07
136	haikal	testing	2024-02-22	2024-05-22	ON_GOING	/internalorder/hld/20240108115919_Screenshot 2023-09-01 013352.png	/internalorder/lld/20240108115919_Screenshot 2023-09-30 080509.png		136/IO/JSC/0124	134	2024-01-08 11:59:20.162272+07	2024-01-08 11:59:20.162272+07
137	haikal	testing	2024-02-22	2024-05-22	ON_GOING	/internalorder/hld/20240108120030_Screenshot 2023-09-01 013352.png	/internalorder/lld/20240108120030_Screenshot 2023-09-30 080509.png		137/IO/JSC/0124	134	2024-01-08 12:00:31.61484+07	2024-01-08 12:00:31.61484+07
138	haikal	testing	2024-02-22	2024-05-22	ON_GOING	/internalorder/hld/20240108120122_Screenshot 2023-09-01 013352.png	/internalorder/lld/20240108120122_Screenshot 2023-09-30 080509.png		138/IO/JSC/0124	134	2024-01-08 12:01:23.84036+07	2024-01-08 12:01:23.84036+07
140	Jendra	uiux game	2222-02-22	2223-02-22	ON_GOING	/internalorder/hld/20240108125615_Screenshot 2023-09-01 013352.png	/internalorder/lld/20240108125615_Screenshot 2023-09-30 080509.png	https://drive.google.com/file/d/1vhA3VjLiEkYJkV6r5BmYp792BbepyL2P/view?usp=drive_link	140/IO/JSC/0124	121	2024-01-08 12:39:19.398641+07	2024-01-08 12:56:15.410872+07
134	haikal	testing	2024-02-22	2024-05-22	ON_GOING			https://www.figma.com/file/3u8OTfLpxQLpJ65EwStibt/Internal-order-project?type=design&node-id=253-2817&mode=design&t=LKthFhGTVv20Wqf9-0	134/IO/JSC/0124	134	2024-01-08 11:53:11.713941+07	2024-01-08 13:16:45.798683+07
139	haikal	testing	2024-02-22	2024-05-22	ON_GOING	/internalorder/hld/20240108133013_Screenshot 2023-07-28 165427.png	/internalorder/lld/20240108133013_Screenshot 2023-09-26 101849.png	https://www.figma.com/file/3u8OTfLpxQLpJ65EwStibt/Internal-order-project?type=design&node-id=253-2817&mode=design&t=LKthFhGTVv20Wqf9-0	139/IO/JSC/0124	134	2024-01-08 12:30:12.097267+07	2024-01-08 13:30:13.697484+07
\.


           4963.dat                                                                                            0000600 0004000 0002000 00000001366 14546775010 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        125	$2b$12$O96Td1h/5fQW6vPevXByKuNUdzGjojKDIT0s4bFs.i/Webwp88GKy	admin	atsal	atsal@gmail.com	12345	exp	
134	$2b$12$dwLP4Vx2/q7MNvhOi6aFYOFttT.vFs48ipmOZgk.aszeHTiiiZZ4u	admin	jjjj	memeilz@estehsegar.my.id	0977558	jkk	
121	$2b$12$t1qoxihgBcWvxTyD7416dOqAMAr6Q4/uhwIiVut.viRgGGIQaFsSW	admin	haikall	haikal@gmail.com	1234567890	PM	/internalorder/profile/20231229112326_profile.jpg
126	$2b$12$.nUVWu5GQg5JqxVqVrgkUeKne0ty1gGwpyl74mjyWtlW9yldxTaXm	user	fikri	fikri@gmail.com	084567654345	pm	
128	$2b$12$I.7O2wG2e7FN4yxmgvaf7ed.XBbUuhGTIyJHpPGi720ZGp1i2eAte	user	imin	iminslepet@gmail.com	0856546545678	ob	
122	$2b$12$XXYi3gC6VLsUdoD31X6DiOhUh2UWF9nQL6t10.S8qH5uFHQXIDEEi	user	alif	alif@gmail.com	12345	Mage	/internalorder/profile/20231229092700_football.PNG
\.


                                                                                                                                                                                                                                                                          4965.dat                                                                                            0000600 0004000 0002000 00000001351 14546775010 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        rajendra	PM	2024-02-22	4	Tentang KHK	PM	125	125	2024-01-08 01:32:40.828864+07	2024-01-08 01:32:40.828864+07	done	\N	\N	\N	\N
rajendra	PM	2024-02-22	5		PM	125	125	2024-01-08 01:32:52.024275+07	2024-01-08 01:32:52.024275+07	done	\N	\N	\N	\N
rajendra	PM	2024-02-22	37	Testing 1	PM	125	121	2024-01-08 14:38:56.688039+07	2024-01-08 14:38:56.688039+07	\N	Fahmi	MP	Haha	2025-02-22
		\N	38		tes	\N	\N	2024-01-08 14:43:21.211574+07	2024-01-08 14:43:21.211574+07	draft	p	p		\N
jv	sress	1970-01-01	39	hjhv	oioo	161	122	2024-01-08 15:21:18.638503+07	2024-01-08 15:21:18.638503+07	done	hjghg	bbkj	gfcfg	1970-01-01
tdrd	grdgd	1970-01-01	40	ghfgh	dd	162	122	2024-01-08 15:22:06.349182+07	2024-01-08 15:22:06.349182+07	done	yuiuuoewe	erswa	tese	1970-01-01
\.


                                                                                                                                                                                                                                                                                       4967.dat                                                                                            0000600 0004000 0002000 00000010425 14546775010 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        22		127	121	2024-01-08 08:57:07.337041+07	2024-01-08 08:57:07.337041+07	draft
23	haikal	127	121	2024-01-08 08:58:08.662905+07	2024-01-08 08:58:08.662905+07	done
24	jendra	127	121	2024-01-08 08:58:08.671904+07	2024-01-08 08:58:08.671904+07	done
25	debi	127	121	2024-01-08 08:58:08.674906+07	2024-01-08 08:58:08.674906+07	done
26	jidan	127	121	2024-01-08 08:58:08.676906+07	2024-01-08 08:58:08.676906+07	done
27	aselole	127	121	2024-01-08 08:58:08.678911+07	2024-01-08 08:58:08.678911+07	done
28	jgvjc	129	122	2024-01-08 09:24:17.80383+07	2024-01-08 09:24:17.80383+07	done
29	kbkhgb	129	122	2024-01-08 09:24:17.810832+07	2024-01-08 09:24:17.810832+07	done
30	njjgg	129	122	2024-01-08 09:24:17.813844+07	2024-01-08 09:24:17.813844+07	done
31	jgvjc	129	122	2024-01-08 09:24:32.103408+07	2024-01-08 09:24:32.103408+07	done
32	kbkhgb	129	122	2024-01-08 09:24:32.110295+07	2024-01-08 09:24:32.110295+07	done
33	njjgg	129	122	2024-01-08 09:24:32.112296+07	2024-01-08 09:24:32.112296+07	done
34	jgvjc	130	122	2024-01-08 09:24:47.335897+07	2024-01-08 09:24:47.335897+07	done
35	kbkhgb	130	122	2024-01-08 09:24:47.342777+07	2024-01-08 09:24:47.342777+07	done
36	njjgg	130	122	2024-01-08 09:24:47.344778+07	2024-01-08 09:24:47.344778+07	done
37		131	122	2024-01-08 09:27:36.246803+07	2024-01-08 09:27:36.246803+07	draft
38		132	122	2024-01-08 09:30:29.998749+07	2024-01-08 09:30:29.99775+07	draft
39	vjvgj	132	122	2024-01-08 09:30:57.902211+07	2024-01-08 09:30:57.902211+07	done
40	gvccjvkjb	134	122	2024-01-08 09:37:02.323473+07	2024-01-08 09:37:02.323473+07	done
41		135	122	2024-01-08 10:07:30.654663+07	2024-01-08 10:07:30.654663+07	draft
42		137	122	2024-01-08 10:10:37.176646+07	2024-01-08 10:10:37.176646+07	draft
43		138	122	2024-01-08 10:13:18.863757+07	2024-01-08 10:13:18.863757+07	draft
44		139	122	2024-01-08 10:44:33.629951+07	2024-01-08 10:44:33.629951+07	draft
45		141	122	2024-01-08 11:10:17.664987+07	2024-01-08 11:10:17.664987+07	draft
46		142	122	2024-01-08 11:18:38.56364+07	2024-01-08 11:18:38.56364+07	draft
47		143	122	2024-01-08 11:20:35.328659+07	2024-01-08 11:20:35.328659+07	draft
48		144	122	2024-01-08 11:24:55.91345+07	2024-01-08 11:24:55.91345+07	draft
49	fhhffh	145	122	2024-01-08 11:27:58.66267+07	2024-01-08 11:27:58.66267+07	done
50	gdbbt	146	122	2024-01-08 11:29:27.370463+07	2024-01-08 11:29:27.370463+07	done
51	cfvevc	147	122	2024-01-08 11:30:26.202446+07	2024-01-08 11:30:26.202446+07	done
52	ccdw	148	122	2024-01-08 11:31:23.913559+07	2024-01-08 11:31:23.913559+07	done
53		149	122	2024-01-08 11:43:54.084687+07	2024-01-08 11:43:54.084687+07	draft
54		150	122	2024-01-08 13:19:32.862295+07	2024-01-08 13:19:32.862295+07	draft
55		151	122	2024-01-08 13:34:17.289959+07	2024-01-08 13:34:17.289959+07	draft
56		152	122	2024-01-08 13:36:23.225794+07	2024-01-08 13:36:23.225794+07	draft
57		153	122	2024-01-08 13:40:52.637996+07	2024-01-08 13:40:52.637996+07	draft
58		154	122	2024-01-08 14:04:24.87599+07	2024-01-08 14:04:24.87599+07	draft
59		156	122	2024-01-08 14:07:09.094227+07	2024-01-08 14:07:09.094227+07	draft
60		157	122	2024-01-08 14:07:38.493157+07	2024-01-08 14:07:38.493157+07	draft
61		158	122	2024-01-08 14:51:52.323958+07	2024-01-08 14:51:52.323958+07	draft
62		159	122	2024-01-08 14:54:38.807297+07	2024-01-08 14:54:38.807297+07	draft
63		160	122	2024-01-08 15:01:08.458762+07	2024-01-08 15:01:08.458762+07	draft
64		162	122	2024-01-08 15:21:32.104924+07	2024-01-08 15:21:32.104924+07	draft
65		163	122	2024-01-08 15:37:14.238957+07	2024-01-08 15:37:14.238957+07	draft
66		164	122	2024-01-08 15:39:20.56766+07	2024-01-08 15:39:20.56766+07	draft
67		166	122	2024-01-08 17:06:35.586648+07	2024-01-08 17:06:35.586648+07	draft
68		167	122	2024-01-08 17:10:03.544621+07	2024-01-08 17:10:03.544621+07	draft
69		168	122	2024-01-08 17:18:58.401852+07	2024-01-08 17:18:58.401852+07	draft
70		169	122	2024-01-08 17:29:25.562845+07	2024-01-08 17:29:25.562845+07	draft
71		170	122	2024-01-08 17:29:49.101552+07	2024-01-08 17:29:49.101552+07	draft
72		171	122	2024-01-08 17:30:00.252194+07	2024-01-08 17:30:00.252194+07	draft
73		172	122	2024-01-08 17:31:16.814769+07	2024-01-08 17:31:16.814769+07	draft
74		174	122	2024-01-08 17:41:07.025646+07	2024-01-08 17:41:07.025646+07	draft
75		175	122	2024-01-08 17:49:55.256805+07	2024-01-08 17:49:55.256805+07	draft
76		176	122	2024-01-08 17:51:44.066242+07	2024-01-08 17:51:44.066242+07	draft
\.


                                                                                                                                                                                                                                           4969.dat                                                                                            0000600 0004000 0002000 00000003371 14546775010 0014302 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        /internalorder/hlr/20240108173656_Screenshot 2023-07-28 165427.png	tes1	2			44	147	134	2024-01-08 17:36:57.259414+07	2024-01-08 17:36:57.259414+07	draft
/internalorder/hlr/20240108194058_Surat Rekomendasi Digi Up-614.pdf		2	3	4	45	128	125	2024-01-08 19:41:05.390983+07	2024-01-08 19:11:39.907855+07	draft
/internalorder/hlr/20240107160012_Screenshot 2023-09-29 090318.png	tes2	tes2	tes2	tes2	36	124	121	2024-01-07 16:00:12.637952+07	2024-01-07 16:00:12.637952+07	done
/internalorder/hlr/20240107155950_football.PNG	tes2	2		tes2	35	124	121	2024-01-07 16:12:27.184152+07	2024-01-07 15:59:50.511557+07	draft
		tes2	3	tes1	34	124	121	2024-01-07 20:24:34.923205+07	2024-01-07 15:59:22.407781+07	draft
/internalorder/hlr/20240108092400_americano.jpeg	gjgjfc	fufu	vgjvgjc	ghchg	37	129	122	2024-01-08 09:24:02.272879+07	2024-01-08 09:24:02.272879+07	done
/internalorder/hlr/20240108092444_americano.jpeg	gjgjfc	fufu	vgjvgjc	ghchg	38	130	122	2024-01-08 09:24:44.344566+07	2024-01-08 09:24:44.344566+07	done
/internalorder/hlr/20240108093124_01476162115siapkan cafe.jpeg	gvghcvg	ghvhc	fcfc	ghch	39	133	122	2024-01-08 09:31:24.430382+07	2024-01-08 09:31:24.430382+07	done
/internalorder/hlr/20240108093656_americano.jpeg	jvv	gvghv	dcdx	kjnkjf	40	134	122	2024-01-08 09:36:56.310331+07	2024-01-08 09:36:56.310331+07	done
/internalorder/hlr/20240108112745_01476162115siapkan cafe.jpeg	vfffhgf	gfffh	gjgfyy	ghghgh	41	145	122	2024-01-08 11:27:45.683952+07	2024-01-08 11:27:45.683952+07	done
/internalorder/hlr/20240108113018_01476162115siapkan cafe.jpeg	cevce	cdc	cdwcw	cecfe	42	147	122	2024-01-08 11:30:18.762206+07	2024-01-08 11:30:18.762206+07	done
/internalorder/hlr/20240108113115_americano.jpeg	cfeve	cefe	dwv	vev	43	148	122	2024-01-08 11:31:15.402722+07	2024-01-08 11:31:15.402722+07	done
\.


                                                                                                                                                                                                                                                                       4971.dat                                                                                            0000600 0004000 0002000 00000002075 14546775010 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        13	8	Rajendra	MM	Ambil Buff	124	121	2024-01-08 00:33:38.992488+07	2024-01-08 00:33:38.992488+07	done
14	8	Atsal	Offlaner	Cut Lane	124	121	2024-01-08 00:33:39.004491+07	2024-01-08 00:33:39.004491+07	done
15	8	Haikal	Jugler	Ambil Buff	124	121	2024-01-08 00:33:39.006494+07	2024-01-08 00:33:39.006494+07	done
16	8	Rajendra	MM	Ambil Buff	124	121	2024-01-08 00:36:17.919866+07	2024-01-08 00:36:17.919866+07	done
17	8	Atsal		Cut Lane	124	121	2024-01-08 00:36:17.927743+07	2024-01-08 00:36:17.927743+07	draft
18	8	Haikal	Jugler	Ambil Buff	124	121	2024-01-08 00:36:17.930742+07	2024-01-08 00:36:17.930742+07	done
19	\N	\N	\N	\N	125	121	2024-01-08 16:27:05.593282+07	2024-01-08 16:27:05.593282+07	draft
20	\N	\N	\N	\N	125	121	2024-01-08 16:34:27.463771+07	2024-01-08 16:34:27.463771+07	draft
21	8	Rajendra	MM	Ambil Buff	124	121	2024-01-08 17:09:09.10846+07	2024-01-08 17:09:09.10846+07	done
22	8	Atsal		Cut Lane	124	121	2024-01-08 17:09:09.114462+07	2024-01-08 17:09:09.114462+07	draft
23	8	Haikal	Jugler	Ambil Buff	124	121	2024-01-08 17:09:09.117463+07	2024-01-08 17:09:09.117463+07	done
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                   4973.dat                                                                                            0000600 0004000 0002000 00000011373 14546775010 0014276 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        tes1	mengerjakan codingan	8	24 Maret 2024	123	121	2024-01-07 21:16:01.713344+07	2024-01-07 21:16:01.713344+07	\N
tes2	endpoint	9	20 Februari 2024	123	121	2024-01-07 21:16:01.724214+07	2024-01-07 21:16:01.724214+07	\N
tes3	target	10	25 Januari 2024	123	121	2024-01-07 21:16:01.726215+07	2024-01-07 21:16:01.726215+07	\N
tes1	mengerjakan codingan	11	24 Maret 2024	123	121	2024-01-07 21:20:35.164053+07	2024-01-07 21:20:35.164053+07	done
tes2	endpoint	12	20 Februari 2024	123	121	2024-01-07 21:20:35.171054+07	2024-01-07 21:20:35.171054+07	done
tes3	target	13	25 Januari 2024	123	121	2024-01-07 21:20:35.173056+07	2024-01-07 21:20:35.173056+07	done
tes1	mengerjakan codingan	14	24 Maret 2024	123	121	2024-01-07 21:21:51.750991+07	2024-01-07 21:21:51.750991+07	done
tes2	endpoint	15	20 Februari 2024	123	121	2024-01-07 21:21:51.75799+07	2024-01-07 21:21:51.75799+07	done
tes3	target	16	25 Januari 2024	123	121	2024-01-07 21:21:51.760992+07	2024-01-07 21:21:51.760992+07	done
tes1	mengerjakan codingan	17	24 Maret 2024	123	121	2024-01-07 21:34:07.040265+07	2024-01-07 21:34:07.040265+07	draft
tes2	endpoint	18	20 Februari 2024	123	121	2024-01-07 21:34:07.048268+07	2024-01-07 21:34:07.048268+07	draft
tes1	mengerjakan codingan	20	24 Maret 2024	123	121	2024-01-07 21:51:16.625185+07	2024-01-07 21:51:16.625185+07	draft
tes2	endpoint	21	20 Februari 2024	123	121	2024-01-07 21:51:16.632184+07	2024-01-07 21:51:16.632184+07	draft
tes3	target	22	25 Januari 2024	123	121	2024-01-07 21:51:16.635187+07	2024-01-07 21:51:16.635187+07	draft
	mengerjakan codingan	23	24 Maret 2024	123	121	2024-01-07 21:54:35.032834+07	2024-01-07 21:54:35.032834+07	draft
tes2	endpoint	24	20 Februari 2024	123	121	2024-01-07 21:54:35.041837+07	2024-01-07 21:54:35.041837+07	done
tes3	target	25	25 Januari 2024	123	121	2024-01-07 21:54:35.044836+07	2024-01-07 21:54:35.044836+07	done
	target	19	25 Januari 2024	123	121	2024-01-07 22:11:37.445793+07	2024-01-07 21:34:07.051271+07	draft
thdr	thdht	26	hjvg	132	122	2024-01-08 09:30:35.433299+07	2024-01-08 09:30:35.433299+07	done
bhjvhj	vjgv	27	nbvn	134	122	2024-01-08 09:37:18.305986+07	2024-01-08 09:37:18.305986+07	done
		28		135	122	2024-01-08 10:07:33.103138+07	2024-01-08 10:07:33.103138+07	draft
		29		137	122	2024-01-08 10:10:39.185812+07	2024-01-08 10:10:39.185812+07	draft
		30		138	122	2024-01-08 10:13:19.810781+07	2024-01-08 10:13:19.810781+07	draft
		31		139	122	2024-01-08 10:44:34.965017+07	2024-01-08 10:44:34.965017+07	draft
		32		141	122	2024-01-08 11:10:18.701206+07	2024-01-08 11:10:18.700219+07	draft
		33		142	122	2024-01-08 11:18:41.45341+07	2024-01-08 11:18:41.45341+07	draft
		34		143	122	2024-01-08 11:20:40.704376+07	2024-01-08 11:20:40.704376+07	draft
		35		144	122	2024-01-08 11:24:57.224356+07	2024-01-08 11:24:57.224356+07	draft
		36		148	122	2024-01-08 11:31:44.117992+07	2024-01-08 11:31:44.117992+07	draft
		37		149	122	2024-01-08 11:43:55.006163+07	2024-01-08 11:43:55.006163+07	draft
		38		150	122	2024-01-08 13:19:33.864276+07	2024-01-08 13:19:33.864276+07	draft
		39		151	122	2024-01-08 13:34:19.182096+07	2024-01-08 13:34:19.182096+07	draft
		40		152	122	2024-01-08 13:36:24.075803+07	2024-01-08 13:36:24.075803+07	draft
		41		153	122	2024-01-08 13:45:34.997228+07	2024-01-08 13:45:34.997228+07	draft
		42		154	122	2024-01-08 14:04:28.762556+07	2024-01-08 14:04:28.762556+07	draft
		43		156	122	2024-01-08 14:07:10.382154+07	2024-01-08 14:07:10.382154+07	draft
		44		157	122	2024-01-08 14:07:39.370677+07	2024-01-08 14:07:39.370677+07	draft
		45		158	122	2024-01-08 14:51:53.634002+07	2024-01-08 14:51:53.634002+07	draft
		46		159	122	2024-01-08 14:54:41.386347+07	2024-01-08 14:54:41.386347+07	draft
		47		160	122	2024-01-08 15:01:09.587036+07	2024-01-08 15:01:09.587036+07	draft
		48		162	122	2024-01-08 15:21:33.299993+07	2024-01-08 15:21:33.299993+07	draft
		49		163	122	2024-01-08 15:37:17.305987+07	2024-01-08 15:37:17.305987+07	draft
		50		164	122	2024-01-08 15:39:21.477494+07	2024-01-08 15:39:21.477494+07	draft
		51		166	122	2024-01-08 17:06:37.769327+07	2024-01-08 17:06:37.769327+07	draft
		52		167	122	2024-01-08 17:10:04.948451+07	2024-01-08 17:10:04.948451+07	draft
		53		168	122	2024-01-08 17:18:59.807815+07	2024-01-08 17:18:59.807815+07	draft
		54		169	122	2024-01-08 17:29:26.533983+07	2024-01-08 17:29:26.533983+07	draft
		55		169	122	2024-01-08 17:29:33.139107+07	2024-01-08 17:29:33.139107+07	draft
		56		170	122	2024-01-08 17:29:49.789062+07	2024-01-08 17:29:49.789062+07	draft
		57		171	122	2024-01-08 17:30:01.447038+07	2024-01-08 17:30:01.447038+07	draft
		58		172	122	2024-01-08 17:31:18.341879+07	2024-01-08 17:31:18.341879+07	draft
		59		174	122	2024-01-08 17:41:08.196942+07	2024-01-08 17:41:08.196942+07	draft
		60		175	122	2024-01-08 17:49:56.250202+07	2024-01-08 17:49:56.250202+07	draft
		61		176	122	2024-01-08 17:51:45.314039+07	2024-01-08 17:51:45.314039+07	draft
\.


                                                                                                                                                                                                                                                                     4975.dat                                                                                            0000600 0004000 0002000 00000010752 14546775010 0014300 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        						146		2024-01-08 04:29:21.835083	122	2024-01-08 11:29:21.842293+07	draft
gjghgj	jvhv	jgh	hvvh	hc	hgh	147	jfhgj	2024-01-08 04:29:54.124413	122	2024-01-08 11:29:54.128412+07	done
testing						124		2024-01-06 05:20:16.465055	121	2024-01-06 12:20:16.470938+07	draft
p						125		2024-01-06 05:26:06.063897	121	2024-01-06 12:26:06.070896+07	draft
cecvv	dwvcw	dcwc	dwv	dwc	dw	148	dwcw	2024-01-08 04:31:04.516054	122	2024-01-08 11:31:04.523055+07	done
pe	p	tes	tes	YTHJHasdsda	123	126	123	2024-01-06 05:33:40.664177	121	2024-01-06 12:45:27.023414+07	done
testing	asljasajksdajk					122		2024-01-06 05:05:22.389311	121	2024-01-06 12:45:40.117645+07	draft
						149		2024-01-08 04:43:51.13434	122	2024-01-08 11:43:51.142348+07	draft
						150		2024-01-08 06:19:30.648616	122	2024-01-08 13:19:30.655759+07	draft
testing	tes	jkasjkadsjaskd	p	YTHJHasdsda	dsadasasd	123	dasdsaasd	2024-01-06 05:08:14.956575	121	2024-01-06 12:48:24.013198+07	done
						127		2024-01-08 01:57:00.902515	122	2024-01-08 08:57:00.920522+07	draft
						128		2024-01-08 02:08:44.670041	122	2024-01-08 09:08:44.678135+07	draft
khbh	jv	yugyu	giy	gigi	giyvy	129	fyuyu	2024-01-08 02:23:50.031335	122	2024-01-08 09:23:50.037343+07	done
khbh	jv	yugyu	giy	gigi	giyvy	130	fyuyu	2024-01-08 02:24:42.843226	122	2024-01-08 09:24:42.848228+07	done
						131		2024-01-08 02:27:33.557476	122	2024-01-08 09:27:33.56304+07	draft
						132		2024-01-08 02:30:27.268892	122	2024-01-08 09:30:27.275769+07	draft
						151		2024-01-08 06:34:10.55377	122	2024-01-08 13:34:10.559879+07	draft
						152		2024-01-08 06:36:20.954124	122	2024-01-08 13:36:20.961124+07	draft
						153		2024-01-08 06:40:49.85402	122	2024-01-08 13:40:49.860734+07	draft
						154		2024-01-08 07:04:21.131629	122	2024-01-08 14:04:21.140224+07	draft
						155		2024-01-08 07:06:57.546712	122	2024-01-08 14:06:57.552715+07	draft
						156		2024-01-08 07:07:06.94457	122	2024-01-08 14:07:06.949573+07	draft
						157		2024-01-08 07:07:36.123058	122	2024-01-08 14:07:36.131063+07	draft
						158		2024-01-08 07:51:49.761295	122	2024-01-08 14:51:49.769166+07	draft
aselole	vgvghv	g	gjvgh	gvv	jvv	133	jgvjg	2024-01-08 02:31:15.941792	122	2024-01-08 09:31:15.946793+07	done
						159		2024-01-08 07:54:34.500813	122	2024-01-08 14:54:34.5087+07	draft
uhhuy	hjhj	jgvj	ghhv	ghfhfhg	fghfhg	134	gygg	2024-01-08 02:36:47.449384	122	2024-01-08 09:36:47.456386+07	done
						135		2024-01-08 03:07:27.694656	122	2024-01-08 10:07:27.701671+07	draft
						136		2024-01-08 03:10:25.18692	122	2024-01-08 10:10:25.19292+07	draft
						137		2024-01-08 03:10:33.943191	122	2024-01-08 10:10:33.952193+07	draft
						138		2024-01-08 03:13:15.303391	122	2024-01-08 10:13:15.311147+07	draft
						139		2024-01-08 03:44:27.184707	122	2024-01-08 10:44:27.193058+07	draft
\N	\N	\N	\N	\N	\N	140		2024-01-08 04:09:52.830344	122	2024-01-08 11:09:52.835234+07	draft
						141		2024-01-08 04:10:15.135364	122	2024-01-08 11:10:15.141316+07	draft
						142		2024-01-08 04:18:36.056096	122	2024-01-08 11:18:36.065095+07	draft
						143		2024-01-08 04:20:32.474878	122	2024-01-08 11:20:32.481973+07	draft
						144		2024-01-08 04:24:53.146631	122	2024-01-08 11:24:53.153632+07	draft
hjhj	bm	d	nm	y	nm	145	fnmn	2024-01-08 04:27:30.158249	122	2024-01-08 11:27:30.164255+07	done
						160		2024-01-08 08:01:05.541755	122	2024-01-08 15:01:05.548754+07	draft
						161		2024-01-08 08:07:09.136996	122	2024-01-08 15:07:09.141998+07	draft
						162		2024-01-08 08:21:29.512346	122	2024-01-08 15:21:29.519238+07	draft
						163		2024-01-08 08:37:10.367856	122	2024-01-08 15:37:10.383026+07	draft
						164		2024-01-08 08:39:15.498778	122	2024-01-08 15:39:15.504914+07	draft
						165		2024-01-08 09:25:59.597926	122	2024-01-08 16:25:59.613904+07	draft
						166		2024-01-08 10:06:33.111625	122	2024-01-08 17:06:33.127625+07	draft
						167		2024-01-08 10:09:59.736543	122	2024-01-08 17:09:59.743544+07	draft
						168		2024-01-08 10:18:55.678735	122	2024-01-08 17:18:55.692738+07	draft
						169		2024-01-08 10:29:22.713307	122	2024-01-08 17:29:22.720434+07	draft
						170		2024-01-08 10:29:46.508959	122	2024-01-08 17:29:46.51496+07	draft
						171		2024-01-08 10:29:57.204071	122	2024-01-08 17:29:57.211071+07	draft
						172		2024-01-08 10:31:12.155437	122	2024-01-08 17:31:12.161438+07	draft
						173		2024-01-08 10:31:54.665233	122	2024-01-08 17:31:54.671116+07	draft
						174		2024-01-08 10:41:03.940432	122	2024-01-08 17:41:03.947432+07	draft
						175		2024-01-08 10:49:52.739343	122	2024-01-08 17:49:52.746343+07	draft
						176		2024-01-08 10:51:38.517671	122	2024-01-08 17:51:38.523676+07	draft
\.


                      4977.dat                                                                                            0000600 0004000 0002000 00000002214 14546775010 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        Jendra	Rp.775.000.000 (TUJUH RATUS TUJUH PULUH LIMA JUTA)	2024-02-22	2024-03-31	5	125	125	2024-01-08 00:51:39.109981+07	2024-01-08 00:51:39.109981+07	done
	Rp.775.000.000 (TUJUH RATUS TUJUH PULUH LIMA JUTA)	2024-02-22	2024-03-31	6	125	125	2024-01-08 00:51:47.77408+07	2024-01-08 00:51:47.77408+07	done
	Rp.775.000.000 (TUJUH RATUS TUJUH PULUH LIMA JUTA)	2024-02-22	2024-03-31	7	125	125	2024-01-08 00:53:06.142423+07	2024-01-08 00:53:06.142423+07	draft
		2024-02-22	2024-03-31	8	125	125	2024-01-08 00:53:13.613093+07	2024-01-08 00:53:13.613093+07	draft
		\N	2024-03-31	9	125	125	2024-01-08 00:53:22.86485+07	2024-01-08 00:53:22.86485+07	draft
	Rp.775.000.000 (TUJUH RATUS TUJUH PULUH LIMA JUTA)	2024-02-22	2024-03-31	10	125	125	2024-01-08 00:54:02.015206+07	2024-01-08 00:53:28.949554+07	draft
tes1	Rp.775.000.000 (TUJUH RATUS TUJUH PULUH LIMA JUTA)	2024-02-22	\N	11	124	125	2024-01-08 11:20:06.744819+07	2024-01-08 11:20:06.744819+07	draft
hjvjg	20000	2024-01-01	2024-01-14	12	144	122	2024-01-08 11:25:14.385502+07	2024-01-08 11:25:14.384383+07	done
gger	20000	2024-01-01	2024-01-14	13	148	122	2024-01-08 11:32:21.794131+07	2024-01-08 11:32:21.794131+07	done
\.


                                                                                                                                                                                                                                                                                                                                                                                    4979.dat                                                                                            0000600 0004000 0002000 00000000714 14546775010 0014301 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        /internalorder/struktur_organisasi/20240107232745_Screenshot 2023-09-23 225812.png	8	125	125	2024-01-07 23:27:47.089367+07	2024-01-07 23:27:47.089367+07	done
/internalorder/struktur_organisasi/20240107233917_football.PNG	9	126	121	2024-01-07 23:39:17.145293+07	2024-01-07 23:28:11.378242+07	done
/internalorder/struktur_organisasi/20240108170824_Screenshot 2023-07-28 165427.png	10	149	128	2024-01-08 17:08:25.485121+07	2024-01-08 17:08:25.484116+07	done
\.


                                                    4984.dat                                                                                            0000600 0004000 0002000 00000000005 14546775010 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4981.dat                                                                                            0000600 0004000 0002000 00000001206 14546775010 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        KHK Document	LUNAS	/internalorder/document/20240108010056_Screenshot 2023-09-20 103551.png	3	125	125	2024-01-08 01:00:57.192161+07	2024-01-08 01:00:57.19116+07	\N
KHK Document	LUNAS	/internalorder/document/20240108010400_Screenshot 2023-07-28 165427.png	4	125	125	2024-01-08 01:04:01.596686+07	2024-01-08 01:04:01.596686+07	\N
KHK Document	LUNAS	/internalorder/document/20240108010610_Screenshot 2023-09-20 103551.png	5	125	125	2024-01-08 01:06:11.55525+07	2024-01-08 01:06:11.55525+07	done
		/internalorder/document/20240108012353_Screenshot 2023-07-28 165427.png	6	125	125	2024-01-08 01:24:08.355555+07	2024-01-08 01:06:17.206091+07	draft
\.


                                                                                                                                                                                                                                                                                                                                                                                          restore.sql                                                                                         0000600 0004000 0002000 00000141267 14546775010 0015410 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE db;
--
-- Name: db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE db OWNER TO postgres;

\connect db

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: internal_order; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA internal_order;


ALTER SCHEMA internal_order OWNER TO pg_database_owner;

--
-- Name: SCHEMA internal_order; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA internal_order IS 'standard public schema';


--
-- Name: project_charter; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA project_charter;


ALTER SCHEMA project_charter OWNER TO postgres;

--
-- Name: action_activity; Type: TYPE; Schema: internal_order; Owner: postgres
--

CREATE TYPE internal_order.action_activity AS ENUM (
    'added',
    'deleted',
    'changed'
);


ALTER TYPE internal_order.action_activity OWNER TO postgres;

--
-- Name: project_status; Type: TYPE; Schema: internal_order; Owner: postgres
--

CREATE TYPE internal_order.project_status AS ENUM (
    'ON_GOING',
    'FINISH',
    'DROPPED'
);


ALTER TYPE internal_order.project_status OWNER TO postgres;

--
-- Name: role; Type: TYPE; Schema: internal_order; Owner: postgres
--

CREATE TYPE internal_order.role AS ENUM (
    'admin',
    'user'
);


ALTER TYPE internal_order.role OWNER TO postgres;

--
-- Name: roles; Type: TYPE; Schema: internal_order; Owner: postgres
--

CREATE TYPE internal_order.roles AS ENUM (
    'PM/Scrum Master',
    'Senior Business Analyst',
    'Product Owner',
    'UI UX designer',
    'Senior Programmer Backend',
    'Senior Programmer FrontEnd',
    'Mobile Developer',
    'Design Grafis',
    'FullStack Developer',
    'DBA',
    'DevOps',
    'Business Analyst',
    'Junior Programmer Backend',
    'Junior Programmer FrontEnd',
    'Technical Writer',
    'Tester'
);


ALTER TYPE internal_order.roles OWNER TO postgres;

--
-- Name: status_project; Type: TYPE; Schema: project_charter; Owner: postgres
--

CREATE TYPE project_charter.status_project AS ENUM (
    'draft',
    'done'
);


ALTER TYPE project_charter.status_project OWNER TO postgres;

--
-- Name: generate_sequence(); Type: FUNCTION; Schema: internal_order; Owner: postgres
--

CREATE FUNCTION internal_order.generate_sequence() RETURNS text
    LANGUAGE plpgsql
    AS $$
declare 
	year_part text ;
	month_part text;
	sequence_part text;
begin
	month_part := to_char(current_date, 'MM');
	year_part := right(extract (year from current_date)::text, 2); 
	sequence_part := LPAD (NEXTVAL('"internal order".sequ_number'):: text ,3, '0');
	
return CONCAT (sequence_part, '/IO/JSC/', month_part,year_part);

end;
$$;


ALTER FUNCTION internal_order.generate_sequence() OWNER TO postgres;

--
-- Name: generate_sequence_number(); Type: FUNCTION; Schema: internal_order; Owner: postgres
--

CREATE FUNCTION internal_order.generate_sequence_number() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
   NEW.sequence_number = LPAD(NEW.id_project::VARCHAR, 3, '0') || '/IO/JSC/' || TO_CHAR(CURRENT_DATE, 'MMYY');
   RETURN NEW;
END;
$$;


ALTER FUNCTION internal_order.generate_sequence_number() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activity_log; Type: TABLE; Schema: internal_order; Owner: postgres
--

CREATE TABLE internal_order.activity_log (
    id_activity_log integer NOT NULL,
    detail_activity character varying(255),
    action_activity internal_order.action_activity,
    id_user integer,
    timestampz timestamp without time zone,
    id_project integer,
    id_role integer,
    id_detail_timeline integer
);


ALTER TABLE internal_order.activity_log OWNER TO postgres;

--
-- Name: activity_log_id_activity_log_seq; Type: SEQUENCE; Schema: internal_order; Owner: postgres
--

CREATE SEQUENCE internal_order.activity_log_id_activity_log_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE internal_order.activity_log_id_activity_log_seq OWNER TO postgres;

--
-- Name: activity_log_id_activity_log_seq; Type: SEQUENCE OWNED BY; Schema: internal_order; Owner: postgres
--

ALTER SEQUENCE internal_order.activity_log_id_activity_log_seq OWNED BY internal_order.activity_log.id_activity_log;


--
-- Name: detail_main_power; Type: TABLE; Schema: internal_order; Owner: postgres
--

CREATE TABLE internal_order.detail_main_power (
    id_role integer NOT NULL,
    man_days_rate integer,
    man_power integer,
    days integer,
    role internal_order.roles,
    total_man_rate integer,
    id_user integer,
    id_project integer
);


ALTER TABLE internal_order.detail_main_power OWNER TO postgres;

--
-- Name: detail_main_power_id_role_seq; Type: SEQUENCE; Schema: internal_order; Owner: postgres
--

CREATE SEQUENCE internal_order.detail_main_power_id_role_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE internal_order.detail_main_power_id_role_seq OWNER TO postgres;

--
-- Name: detail_main_power_id_role_seq; Type: SEQUENCE OWNED BY; Schema: internal_order; Owner: postgres
--

ALTER SEQUENCE internal_order.detail_main_power_id_role_seq OWNED BY internal_order.detail_main_power.id_role;


--
-- Name: detail_timeline; Type: TABLE; Schema: internal_order; Owner: postgres
--

CREATE TABLE internal_order.detail_timeline (
    id_detail_timeline integer NOT NULL,
    weeks integer,
    activity character varying(255),
    "createdAt" timestamp with time zone,
    "updateAt" timestamp with time zone,
    id_user integer,
    id_project integer
);


ALTER TABLE internal_order.detail_timeline OWNER TO postgres;

--
-- Name: detail_timeline_id_detail_timeline_seq; Type: SEQUENCE; Schema: internal_order; Owner: postgres
--

CREATE SEQUENCE internal_order.detail_timeline_id_detail_timeline_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE internal_order.detail_timeline_id_detail_timeline_seq OWNER TO postgres;

--
-- Name: detail_timeline_id_detail_timeline_seq; Type: SEQUENCE OWNED BY; Schema: internal_order; Owner: postgres
--

ALTER SEQUENCE internal_order.detail_timeline_id_detail_timeline_seq OWNED BY internal_order.detail_timeline.id_detail_timeline;


--
-- Name: nomor_sequence; Type: SEQUENCE; Schema: internal_order; Owner: postgres
--

CREATE SEQUENCE internal_order.nomor_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1;


ALTER SEQUENCE internal_order.nomor_sequence OWNER TO postgres;

--
-- Name: project_internal; Type: TABLE; Schema: internal_order; Owner: postgres
--

CREATE TABLE internal_order.project_internal (
    id_project integer NOT NULL,
    requester character varying(100),
    application_name character varying(100),
    start_date date NOT NULL,
    end_date date NOT NULL,
    status internal_order.project_status,
    hld character varying(255),
    lld character varying(255),
    brd character varying(255),
    sequence_number character varying(20),
    id_user integer,
    "createdAt" timestamp with time zone,
    "updateAt" timestamp with time zone
);


ALTER TABLE internal_order.project_internal OWNER TO postgres;

--
-- Name: project_internal_id_project_seq; Type: SEQUENCE; Schema: internal_order; Owner: postgres
--

CREATE SEQUENCE internal_order.project_internal_id_project_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE internal_order.project_internal_id_project_seq OWNER TO postgres;

--
-- Name: project_internal_id_project_seq; Type: SEQUENCE OWNED BY; Schema: internal_order; Owner: postgres
--

ALTER SEQUENCE internal_order.project_internal_id_project_seq OWNED BY internal_order.project_internal.id_project;


--
-- Name: sequ_number; Type: SEQUENCE; Schema: internal_order; Owner: postgres
--

CREATE SEQUENCE internal_order.sequ_number
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE internal_order.sequ_number OWNER TO postgres;

--
-- Name: sequence_number; Type: SEQUENCE; Schema: internal_order; Owner: postgres
--

CREATE SEQUENCE internal_order.sequence_number
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 9999
    CACHE 1;


ALTER SEQUENCE internal_order.sequence_number OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: internal_order; Owner: postgres
--

CREATE TABLE internal_order."user" (
    id_user integer NOT NULL,
    password character varying(255) NOT NULL,
    hak_akses internal_order.role,
    nama character varying(255),
    email character varying(255),
    phone character varying(15),
    jabatan character varying(255),
    profile character varying(255)
);


ALTER TABLE internal_order."user" OWNER TO postgres;

--
-- Name: user_id_user_seq; Type: SEQUENCE; Schema: internal_order; Owner: postgres
--

CREATE SEQUENCE internal_order.user_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE internal_order.user_id_user_seq OWNER TO postgres;

--
-- Name: user_id_user_seq; Type: SEQUENCE OWNED BY; Schema: internal_order; Owner: postgres
--

ALTER SEQUENCE internal_order.user_id_user_seq OWNED BY internal_order."user".id_user;


--
-- Name: approvedBy; Type: TABLE; Schema: project_charter; Owner: postgres
--

CREATE TABLE project_charter."approvedBy" (
    nama character varying(255),
    cc_to character varying(255),
    tanggal date,
    id_approv integer NOT NULL,
    note character varying(255),
    title character varying(255),
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_approvedby project_charter.status_project,
    nama1 character varying(255),
    title1 character varying(255),
    cc_to1 character varying(255),
    tanggal1 date
);


ALTER TABLE project_charter."approvedBy" OWNER TO postgres;

--
-- Name: approvedBy_id_approv_seq; Type: SEQUENCE; Schema: project_charter; Owner: postgres
--

CREATE SEQUENCE project_charter."approvedBy_id_approv_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE project_charter."approvedBy_id_approv_seq" OWNER TO postgres;

--
-- Name: approvedBy_id_approv_seq; Type: SEQUENCE OWNED BY; Schema: project_charter; Owner: postgres
--

ALTER SEQUENCE project_charter."approvedBy_id_approv_seq" OWNED BY project_charter."approvedBy".id_approv;


--
-- Name: deliverable; Type: TABLE; Schema: project_charter; Owner: postgres
--

CREATE TABLE project_charter.deliverable (
    id_deliverable integer NOT NULL,
    deliverables character varying(255),
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_deliverable project_charter.status_project
);


ALTER TABLE project_charter.deliverable OWNER TO postgres;

--
-- Name: deliverable_id_deliverable_seq; Type: SEQUENCE; Schema: project_charter; Owner: postgres
--

CREATE SEQUENCE project_charter.deliverable_id_deliverable_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE project_charter.deliverable_id_deliverable_seq OWNER TO postgres;

--
-- Name: deliverable_id_deliverable_seq; Type: SEQUENCE OWNED BY; Schema: project_charter; Owner: postgres
--

ALTER SEQUENCE project_charter.deliverable_id_deliverable_seq OWNED BY project_charter.deliverable.id_deliverable;


--
-- Name: description; Type: TABLE; Schema: project_charter; Owner: postgres
--

CREATE TABLE project_charter.description (
    hlr character varying(255),
    assumptions character varying(255),
    contraints character varying(255),
    risk character varying(255),
    key_stakeholders character varying(255),
    id_description integer NOT NULL,
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_description project_charter.status_project
);


ALTER TABLE project_charter.description OWNER TO postgres;

--
-- Name: description_id_description_seq; Type: SEQUENCE; Schema: project_charter; Owner: postgres
--

CREATE SEQUENCE project_charter.description_id_description_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE project_charter.description_id_description_seq OWNER TO postgres;

--
-- Name: description_id_description_seq; Type: SEQUENCE OWNED BY; Schema: project_charter; Owner: postgres
--

ALTER SEQUENCE project_charter.description_id_description_seq OWNED BY project_charter.description.id_description;


--
-- Name: detail_responsibilities; Type: TABLE; Schema: project_charter; Owner: postgres
--

CREATE TABLE project_charter.detail_responsibilities (
    id_detail_roleresponsibilities integer NOT NULL,
    id_responsibilities integer,
    nama_pc character varying(255),
    role_pc character varying(255),
    description character varying(255),
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_detailresponsibilities project_charter.status_project
);


ALTER TABLE project_charter.detail_responsibilities OWNER TO postgres;

--
-- Name: detail_responsibilities_id_detail_roleresponsibilities_seq; Type: SEQUENCE; Schema: project_charter; Owner: postgres
--

CREATE SEQUENCE project_charter.detail_responsibilities_id_detail_roleresponsibilities_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE project_charter.detail_responsibilities_id_detail_roleresponsibilities_seq OWNER TO postgres;

--
-- Name: detail_responsibilities_id_detail_roleresponsibilities_seq; Type: SEQUENCE OWNED BY; Schema: project_charter; Owner: postgres
--

ALTER SEQUENCE project_charter.detail_responsibilities_id_detail_roleresponsibilities_seq OWNED BY project_charter.detail_responsibilities.id_detail_roleresponsibilities;


--
-- Name: milostones; Type: TABLE; Schema: project_charter; Owner: postgres
--

CREATE TABLE project_charter.milostones (
    milestone character varying(50),
    deskripsi character varying(50),
    id_milostone integer NOT NULL,
    tanggal character varying(255),
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_milostones project_charter.status_project
);


ALTER TABLE project_charter.milostones OWNER TO postgres;

--
-- Name: milostones_id_milostone_seq; Type: SEQUENCE; Schema: project_charter; Owner: postgres
--

CREATE SEQUENCE project_charter.milostones_id_milostone_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE project_charter.milostones_id_milostone_seq OWNER TO postgres;

--
-- Name: milostones_id_milostone_seq; Type: SEQUENCE OWNED BY; Schema: project_charter; Owner: postgres
--

ALTER SEQUENCE project_charter.milostones_id_milostone_seq OWNED BY project_charter.milostones.id_milostone;


--
-- Name: project_charter; Type: TABLE; Schema: project_charter; Owner: postgres
--

CREATE TABLE project_charter.project_charter (
    project_name character varying,
    project_manager character varying,
    customer character varying,
    end_customer character varying,
    bu_delivery character varying,
    bu_related character varying,
    id_charter integer NOT NULL,
    project_description character varying(255),
    "createdAt" timestamp without time zone,
    id_user integer,
    "updateAt" timestamp with time zone,
    status_project project_charter.status_project
);


ALTER TABLE project_charter.project_charter OWNER TO postgres;

--
-- Name: project_charter_id_project_seq; Type: SEQUENCE; Schema: project_charter; Owner: postgres
--

CREATE SEQUENCE project_charter.project_charter_id_project_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE project_charter.project_charter_id_project_seq OWNER TO postgres;

--
-- Name: project_charter_id_project_seq; Type: SEQUENCE OWNED BY; Schema: project_charter; Owner: postgres
--

ALTER SEQUENCE project_charter.project_charter_id_project_seq OWNED BY project_charter.project_charter.id_charter;


--
-- Name: responsibility; Type: TABLE; Schema: project_charter; Owner: postgres
--

CREATE TABLE project_charter.responsibility (
    pm_responsibility character varying(255),
    project_value character varying(255),
    start_date date,
    end_date date,
    id_responsibility integer NOT NULL,
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_responsibility project_charter.status_project
);


ALTER TABLE project_charter.responsibility OWNER TO postgres;

--
-- Name: responsibility_id_responsibility_seq; Type: SEQUENCE; Schema: project_charter; Owner: postgres
--

CREATE SEQUENCE project_charter.responsibility_id_responsibility_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE project_charter.responsibility_id_responsibility_seq OWNER TO postgres;

--
-- Name: responsibility_id_responsibility_seq; Type: SEQUENCE OWNED BY; Schema: project_charter; Owner: postgres
--

ALTER SEQUENCE project_charter.responsibility_id_responsibility_seq OWNED BY project_charter.responsibility.id_responsibility;


--
-- Name: role_responsibilities; Type: TABLE; Schema: project_charter; Owner: postgres
--

CREATE TABLE project_charter.role_responsibilities (
    struktur_organisasi character varying(255),
    id_responsibilities integer NOT NULL,
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_responsibilities project_charter.status_project
);


ALTER TABLE project_charter.role_responsibilities OWNER TO postgres;

--
-- Name: role_responsibilities_id_responsibilities_seq; Type: SEQUENCE; Schema: project_charter; Owner: postgres
--

CREATE SEQUENCE project_charter.role_responsibilities_id_responsibilities_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE project_charter.role_responsibilities_id_responsibilities_seq OWNER TO postgres;

--
-- Name: role_responsibilities_id_responsibilities_seq; Type: SEQUENCE OWNED BY; Schema: project_charter; Owner: postgres
--

ALTER SEQUENCE project_charter.role_responsibilities_id_responsibilities_seq OWNED BY project_charter.role_responsibilities.id_responsibilities;


--
-- Name: status; Type: TABLE; Schema: project_charter; Owner: postgres
--

CREATE TABLE project_charter.status (
    id_status integer NOT NULL,
    status project_charter.status_project,
    id_description integer,
    id_deliverable integer,
    id_milostone integer,
    id_responsibilities integer,
    id_responsibility integer,
    id_supporting integer,
    id_approv integer,
    id_charter integer,
    id_detail_roleresponsibilities integer
);


ALTER TABLE project_charter.status OWNER TO postgres;

--
-- Name: status_id_status_seq; Type: SEQUENCE; Schema: project_charter; Owner: postgres
--

CREATE SEQUENCE project_charter.status_id_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE project_charter.status_id_status_seq OWNER TO postgres;

--
-- Name: status_id_status_seq; Type: SEQUENCE OWNED BY; Schema: project_charter; Owner: postgres
--

ALTER SEQUENCE project_charter.status_id_status_seq OWNED BY project_charter.status.id_status;


--
-- Name: supporting_doc; Type: TABLE; Schema: project_charter; Owner: postgres
--

CREATE TABLE project_charter.supporting_doc (
    document_name character varying(255),
    notes character varying(255),
    document character varying(255),
    id_supporting integer NOT NULL,
    id_charter integer,
    id_user integer,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone,
    status_supportingdoc project_charter.status_project
);


ALTER TABLE project_charter.supporting_doc OWNER TO postgres;

--
-- Name: supporting_doc_id_supporting_seq; Type: SEQUENCE; Schema: project_charter; Owner: postgres
--

CREATE SEQUENCE project_charter.supporting_doc_id_supporting_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE project_charter.supporting_doc_id_supporting_seq OWNER TO postgres;

--
-- Name: supporting_doc_id_supporting_seq; Type: SEQUENCE OWNED BY; Schema: project_charter; Owner: postgres
--

ALTER SEQUENCE project_charter.supporting_doc_id_supporting_seq OWNED BY project_charter.supporting_doc.id_supporting;


--
-- Name: activity_log id_activity_log; Type: DEFAULT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.activity_log ALTER COLUMN id_activity_log SET DEFAULT nextval('internal_order.activity_log_id_activity_log_seq'::regclass);


--
-- Name: detail_main_power id_role; Type: DEFAULT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.detail_main_power ALTER COLUMN id_role SET DEFAULT nextval('internal_order.detail_main_power_id_role_seq'::regclass);


--
-- Name: detail_timeline id_detail_timeline; Type: DEFAULT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.detail_timeline ALTER COLUMN id_detail_timeline SET DEFAULT nextval('internal_order.detail_timeline_id_detail_timeline_seq'::regclass);


--
-- Name: project_internal id_project; Type: DEFAULT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.project_internal ALTER COLUMN id_project SET DEFAULT nextval('internal_order.project_internal_id_project_seq'::regclass);


--
-- Name: user id_user; Type: DEFAULT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order."user" ALTER COLUMN id_user SET DEFAULT nextval('internal_order.user_id_user_seq'::regclass);


--
-- Name: approvedBy id_approv; Type: DEFAULT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter."approvedBy" ALTER COLUMN id_approv SET DEFAULT nextval('project_charter."approvedBy_id_approv_seq"'::regclass);


--
-- Name: deliverable id_deliverable; Type: DEFAULT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.deliverable ALTER COLUMN id_deliverable SET DEFAULT nextval('project_charter.deliverable_id_deliverable_seq'::regclass);


--
-- Name: description id_description; Type: DEFAULT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.description ALTER COLUMN id_description SET DEFAULT nextval('project_charter.description_id_description_seq'::regclass);


--
-- Name: detail_responsibilities id_detail_roleresponsibilities; Type: DEFAULT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.detail_responsibilities ALTER COLUMN id_detail_roleresponsibilities SET DEFAULT nextval('project_charter.detail_responsibilities_id_detail_roleresponsibilities_seq'::regclass);


--
-- Name: milostones id_milostone; Type: DEFAULT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.milostones ALTER COLUMN id_milostone SET DEFAULT nextval('project_charter.milostones_id_milostone_seq'::regclass);


--
-- Name: project_charter id_charter; Type: DEFAULT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.project_charter ALTER COLUMN id_charter SET DEFAULT nextval('project_charter.project_charter_id_project_seq'::regclass);


--
-- Name: responsibility id_responsibility; Type: DEFAULT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.responsibility ALTER COLUMN id_responsibility SET DEFAULT nextval('project_charter.responsibility_id_responsibility_seq'::regclass);


--
-- Name: role_responsibilities id_responsibilities; Type: DEFAULT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.role_responsibilities ALTER COLUMN id_responsibilities SET DEFAULT nextval('project_charter.role_responsibilities_id_responsibilities_seq'::regclass);


--
-- Name: status id_status; Type: DEFAULT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.status ALTER COLUMN id_status SET DEFAULT nextval('project_charter.status_id_status_seq'::regclass);


--
-- Name: supporting_doc id_supporting; Type: DEFAULT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.supporting_doc ALTER COLUMN id_supporting SET DEFAULT nextval('project_charter.supporting_doc_id_supporting_seq'::regclass);


--
-- Data for Name: activity_log; Type: TABLE DATA; Schema: internal_order; Owner: postgres
--

COPY internal_order.activity_log (id_activity_log, detail_activity, action_activity, id_user, timestampz, id_project, id_role, id_detail_timeline) FROM stdin;
\.
COPY internal_order.activity_log (id_activity_log, detail_activity, action_activity, id_user, timestampz, id_project, id_role, id_detail_timeline) FROM '$$PATH$$/4952.dat';

--
-- Data for Name: detail_main_power; Type: TABLE DATA; Schema: internal_order; Owner: postgres
--

COPY internal_order.detail_main_power (id_role, man_days_rate, man_power, days, role, total_man_rate, id_user, id_project) FROM stdin;
\.
COPY internal_order.detail_main_power (id_role, man_days_rate, man_power, days, role, total_man_rate, id_user, id_project) FROM '$$PATH$$/4954.dat';

--
-- Data for Name: detail_timeline; Type: TABLE DATA; Schema: internal_order; Owner: postgres
--

COPY internal_order.detail_timeline (id_detail_timeline, weeks, activity, "createdAt", "updateAt", id_user, id_project) FROM stdin;
\.
COPY internal_order.detail_timeline (id_detail_timeline, weeks, activity, "createdAt", "updateAt", id_user, id_project) FROM '$$PATH$$/4956.dat';

--
-- Data for Name: project_internal; Type: TABLE DATA; Schema: internal_order; Owner: postgres
--

COPY internal_order.project_internal (id_project, requester, application_name, start_date, end_date, status, hld, lld, brd, sequence_number, id_user, "createdAt", "updateAt") FROM stdin;
\.
COPY internal_order.project_internal (id_project, requester, application_name, start_date, end_date, status, hld, lld, brd, sequence_number, id_user, "createdAt", "updateAt") FROM '$$PATH$$/4959.dat';

--
-- Data for Name: user; Type: TABLE DATA; Schema: internal_order; Owner: postgres
--

COPY internal_order."user" (id_user, password, hak_akses, nama, email, phone, jabatan, profile) FROM stdin;
\.
COPY internal_order."user" (id_user, password, hak_akses, nama, email, phone, jabatan, profile) FROM '$$PATH$$/4963.dat';

--
-- Data for Name: approvedBy; Type: TABLE DATA; Schema: project_charter; Owner: postgres
--

COPY project_charter."approvedBy" (nama, cc_to, tanggal, id_approv, note, title, id_charter, id_user, "updatedAt", "createdAt", status_approvedby, nama1, title1, cc_to1, tanggal1) FROM stdin;
\.
COPY project_charter."approvedBy" (nama, cc_to, tanggal, id_approv, note, title, id_charter, id_user, "updatedAt", "createdAt", status_approvedby, nama1, title1, cc_to1, tanggal1) FROM '$$PATH$$/4965.dat';

--
-- Data for Name: deliverable; Type: TABLE DATA; Schema: project_charter; Owner: postgres
--

COPY project_charter.deliverable (id_deliverable, deliverables, id_charter, id_user, "updatedAt", "createdAt", status_deliverable) FROM stdin;
\.
COPY project_charter.deliverable (id_deliverable, deliverables, id_charter, id_user, "updatedAt", "createdAt", status_deliverable) FROM '$$PATH$$/4967.dat';

--
-- Data for Name: description; Type: TABLE DATA; Schema: project_charter; Owner: postgres
--

COPY project_charter.description (hlr, assumptions, contraints, risk, key_stakeholders, id_description, id_charter, id_user, "updatedAt", "createdAt", status_description) FROM stdin;
\.
COPY project_charter.description (hlr, assumptions, contraints, risk, key_stakeholders, id_description, id_charter, id_user, "updatedAt", "createdAt", status_description) FROM '$$PATH$$/4969.dat';

--
-- Data for Name: detail_responsibilities; Type: TABLE DATA; Schema: project_charter; Owner: postgres
--

COPY project_charter.detail_responsibilities (id_detail_roleresponsibilities, id_responsibilities, nama_pc, role_pc, description, id_charter, id_user, "updatedAt", "createdAt", status_detailresponsibilities) FROM stdin;
\.
COPY project_charter.detail_responsibilities (id_detail_roleresponsibilities, id_responsibilities, nama_pc, role_pc, description, id_charter, id_user, "updatedAt", "createdAt", status_detailresponsibilities) FROM '$$PATH$$/4971.dat';

--
-- Data for Name: milostones; Type: TABLE DATA; Schema: project_charter; Owner: postgres
--

COPY project_charter.milostones (milestone, deskripsi, id_milostone, tanggal, id_charter, id_user, "updatedAt", "createdAt", status_milostones) FROM stdin;
\.
COPY project_charter.milostones (milestone, deskripsi, id_milostone, tanggal, id_charter, id_user, "updatedAt", "createdAt", status_milostones) FROM '$$PATH$$/4973.dat';

--
-- Data for Name: project_charter; Type: TABLE DATA; Schema: project_charter; Owner: postgres
--

COPY project_charter.project_charter (project_name, project_manager, customer, end_customer, bu_delivery, bu_related, id_charter, project_description, "createdAt", id_user, "updateAt", status_project) FROM stdin;
\.
COPY project_charter.project_charter (project_name, project_manager, customer, end_customer, bu_delivery, bu_related, id_charter, project_description, "createdAt", id_user, "updateAt", status_project) FROM '$$PATH$$/4975.dat';

--
-- Data for Name: responsibility; Type: TABLE DATA; Schema: project_charter; Owner: postgres
--

COPY project_charter.responsibility (pm_responsibility, project_value, start_date, end_date, id_responsibility, id_charter, id_user, "updatedAt", "createdAt", status_responsibility) FROM stdin;
\.
COPY project_charter.responsibility (pm_responsibility, project_value, start_date, end_date, id_responsibility, id_charter, id_user, "updatedAt", "createdAt", status_responsibility) FROM '$$PATH$$/4977.dat';

--
-- Data for Name: role_responsibilities; Type: TABLE DATA; Schema: project_charter; Owner: postgres
--

COPY project_charter.role_responsibilities (struktur_organisasi, id_responsibilities, id_charter, id_user, "updatedAt", "createdAt", status_responsibilities) FROM stdin;
\.
COPY project_charter.role_responsibilities (struktur_organisasi, id_responsibilities, id_charter, id_user, "updatedAt", "createdAt", status_responsibilities) FROM '$$PATH$$/4979.dat';

--
-- Data for Name: status; Type: TABLE DATA; Schema: project_charter; Owner: postgres
--

COPY project_charter.status (id_status, status, id_description, id_deliverable, id_milostone, id_responsibilities, id_responsibility, id_supporting, id_approv, id_charter, id_detail_roleresponsibilities) FROM stdin;
\.
COPY project_charter.status (id_status, status, id_description, id_deliverable, id_milostone, id_responsibilities, id_responsibility, id_supporting, id_approv, id_charter, id_detail_roleresponsibilities) FROM '$$PATH$$/4984.dat';

--
-- Data for Name: supporting_doc; Type: TABLE DATA; Schema: project_charter; Owner: postgres
--

COPY project_charter.supporting_doc (document_name, notes, document, id_supporting, id_charter, id_user, "updatedAt", "createdAt", status_supportingdoc) FROM stdin;
\.
COPY project_charter.supporting_doc (document_name, notes, document, id_supporting, id_charter, id_user, "updatedAt", "createdAt", status_supportingdoc) FROM '$$PATH$$/4981.dat';

--
-- Name: activity_log_id_activity_log_seq; Type: SEQUENCE SET; Schema: internal_order; Owner: postgres
--

SELECT pg_catalog.setval('internal_order.activity_log_id_activity_log_seq', 1, true);


--
-- Name: detail_main_power_id_role_seq; Type: SEQUENCE SET; Schema: internal_order; Owner: postgres
--

SELECT pg_catalog.setval('internal_order.detail_main_power_id_role_seq', 186, true);


--
-- Name: detail_timeline_id_detail_timeline_seq; Type: SEQUENCE SET; Schema: internal_order; Owner: postgres
--

SELECT pg_catalog.setval('internal_order.detail_timeline_id_detail_timeline_seq', 162, true);


--
-- Name: nomor_sequence; Type: SEQUENCE SET; Schema: internal_order; Owner: postgres
--

SELECT pg_catalog.setval('internal_order.nomor_sequence', 1, false);


--
-- Name: project_internal_id_project_seq; Type: SEQUENCE SET; Schema: internal_order; Owner: postgres
--

SELECT pg_catalog.setval('internal_order.project_internal_id_project_seq', 140, true);


--
-- Name: sequ_number; Type: SEQUENCE SET; Schema: internal_order; Owner: postgres
--

SELECT pg_catalog.setval('internal_order.sequ_number', 3, true);


--
-- Name: sequence_number; Type: SEQUENCE SET; Schema: internal_order; Owner: postgres
--

SELECT pg_catalog.setval('internal_order.sequence_number', 1, true);


--
-- Name: user_id_user_seq; Type: SEQUENCE SET; Schema: internal_order; Owner: postgres
--

SELECT pg_catalog.setval('internal_order.user_id_user_seq', 134, true);


--
-- Name: approvedBy_id_approv_seq; Type: SEQUENCE SET; Schema: project_charter; Owner: postgres
--

SELECT pg_catalog.setval('project_charter."approvedBy_id_approv_seq"', 40, true);


--
-- Name: deliverable_id_deliverable_seq; Type: SEQUENCE SET; Schema: project_charter; Owner: postgres
--

SELECT pg_catalog.setval('project_charter.deliverable_id_deliverable_seq', 76, true);


--
-- Name: description_id_description_seq; Type: SEQUENCE SET; Schema: project_charter; Owner: postgres
--

SELECT pg_catalog.setval('project_charter.description_id_description_seq', 45, true);


--
-- Name: detail_responsibilities_id_detail_roleresponsibilities_seq; Type: SEQUENCE SET; Schema: project_charter; Owner: postgres
--

SELECT pg_catalog.setval('project_charter.detail_responsibilities_id_detail_roleresponsibilities_seq', 23, true);


--
-- Name: milostones_id_milostone_seq; Type: SEQUENCE SET; Schema: project_charter; Owner: postgres
--

SELECT pg_catalog.setval('project_charter.milostones_id_milostone_seq', 61, true);


--
-- Name: project_charter_id_project_seq; Type: SEQUENCE SET; Schema: project_charter; Owner: postgres
--

SELECT pg_catalog.setval('project_charter.project_charter_id_project_seq', 176, true);


--
-- Name: responsibility_id_responsibility_seq; Type: SEQUENCE SET; Schema: project_charter; Owner: postgres
--

SELECT pg_catalog.setval('project_charter.responsibility_id_responsibility_seq', 13, true);


--
-- Name: role_responsibilities_id_responsibilities_seq; Type: SEQUENCE SET; Schema: project_charter; Owner: postgres
--

SELECT pg_catalog.setval('project_charter.role_responsibilities_id_responsibilities_seq', 10, true);


--
-- Name: status_id_status_seq; Type: SEQUENCE SET; Schema: project_charter; Owner: postgres
--

SELECT pg_catalog.setval('project_charter.status_id_status_seq', 1, false);


--
-- Name: supporting_doc_id_supporting_seq; Type: SEQUENCE SET; Schema: project_charter; Owner: postgres
--

SELECT pg_catalog.setval('project_charter.supporting_doc_id_supporting_seq', 6, true);


--
-- Name: activity_log activity_log_pkey; Type: CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.activity_log
    ADD CONSTRAINT activity_log_pkey PRIMARY KEY (id_activity_log);


--
-- Name: detail_main_power detail_main_power_pkey; Type: CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.detail_main_power
    ADD CONSTRAINT detail_main_power_pkey PRIMARY KEY (id_role);


--
-- Name: detail_timeline detail_timeline_pkey; Type: CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.detail_timeline
    ADD CONSTRAINT detail_timeline_pkey PRIMARY KEY (id_detail_timeline);


--
-- Name: project_internal project_internal_pkey; Type: CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.project_internal
    ADD CONSTRAINT project_internal_pkey PRIMARY KEY (id_project);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);


--
-- Name: approvedBy approvedBy_pkey; Type: CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter."approvedBy"
    ADD CONSTRAINT "approvedBy_pkey" PRIMARY KEY (id_approv);


--
-- Name: deliverable deliverable_pkey; Type: CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.deliverable
    ADD CONSTRAINT deliverable_pkey PRIMARY KEY (id_deliverable);


--
-- Name: description description_pkey; Type: CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.description
    ADD CONSTRAINT description_pkey PRIMARY KEY (id_description);


--
-- Name: detail_responsibilities detail_responsibilities_pkey; Type: CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.detail_responsibilities
    ADD CONSTRAINT detail_responsibilities_pkey PRIMARY KEY (id_detail_roleresponsibilities);


--
-- Name: milostones milostones_pkey; Type: CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.milostones
    ADD CONSTRAINT milostones_pkey PRIMARY KEY (id_milostone);


--
-- Name: project_charter project_charter_pkey; Type: CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.project_charter
    ADD CONSTRAINT project_charter_pkey PRIMARY KEY (id_charter);


--
-- Name: responsibility responsibility_pkey; Type: CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.responsibility
    ADD CONSTRAINT responsibility_pkey PRIMARY KEY (id_responsibility);


--
-- Name: role_responsibilities role_responsibilities_pkey; Type: CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.role_responsibilities
    ADD CONSTRAINT role_responsibilities_pkey PRIMARY KEY (id_responsibilities);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id_status);


--
-- Name: supporting_doc supporting_doc_pkey; Type: CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.supporting_doc
    ADD CONSTRAINT supporting_doc_pkey PRIMARY KEY (id_supporting);


--
-- Name: project_internal sequence_number_trigger; Type: TRIGGER; Schema: internal_order; Owner: postgres
--

CREATE TRIGGER sequence_number_trigger BEFORE INSERT OR UPDATE ON internal_order.project_internal FOR EACH ROW EXECUTE FUNCTION internal_order.generate_sequence_number();


--
-- Name: activity_log fk_id_detail_timeline; Type: FK CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.activity_log
    ADD CONSTRAINT fk_id_detail_timeline FOREIGN KEY (id_detail_timeline) REFERENCES internal_order.detail_timeline(id_detail_timeline);


--
-- Name: detail_main_power fk_id_projecr; Type: FK CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.detail_main_power
    ADD CONSTRAINT fk_id_projecr FOREIGN KEY (id_project) REFERENCES internal_order.project_internal(id_project);


--
-- Name: activity_log fk_id_project; Type: FK CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.activity_log
    ADD CONSTRAINT fk_id_project FOREIGN KEY (id_project) REFERENCES internal_order.project_internal(id_project);


--
-- Name: detail_timeline fk_id_project; Type: FK CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.detail_timeline
    ADD CONSTRAINT fk_id_project FOREIGN KEY (id_project) REFERENCES internal_order.project_internal(id_project);


--
-- Name: activity_log fk_id_role; Type: FK CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.activity_log
    ADD CONSTRAINT fk_id_role FOREIGN KEY (id_role) REFERENCES internal_order.detail_main_power(id_role);


--
-- Name: activity_log fk_id_user; Type: FK CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.activity_log
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);


--
-- Name: detail_timeline fk_id_user; Type: FK CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.detail_timeline
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);


--
-- Name: project_internal fk_id_user; Type: FK CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.project_internal
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);


--
-- Name: detail_main_power fk_id_user; Type: FK CONSTRAINT; Schema: internal_order; Owner: postgres
--

ALTER TABLE ONLY internal_order.detail_main_power
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);


--
-- Name: status fk_id_approv; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_approv FOREIGN KEY (id_approv) REFERENCES project_charter."approvedBy"(id_approv);


--
-- Name: approvedBy fk_id_charter; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter."approvedBy"
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);


--
-- Name: deliverable fk_id_charter; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.deliverable
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);


--
-- Name: description fk_id_charter; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.description
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);


--
-- Name: detail_responsibilities fk_id_charter; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.detail_responsibilities
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);


--
-- Name: milostones fk_id_charter; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.milostones
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);


--
-- Name: responsibility fk_id_charter; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.responsibility
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);


--
-- Name: role_responsibilities fk_id_charter; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.role_responsibilities
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);


--
-- Name: supporting_doc fk_id_charter; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.supporting_doc
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);


--
-- Name: status fk_id_charter; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_charter FOREIGN KEY (id_charter) REFERENCES project_charter.project_charter(id_charter);


--
-- Name: status fk_id_deliverable; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_deliverable FOREIGN KEY (id_deliverable) REFERENCES project_charter.deliverable(id_deliverable);


--
-- Name: status fk_id_detail_roleresponsibilities; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_detail_roleresponsibilities FOREIGN KEY (id_detail_roleresponsibilities) REFERENCES project_charter.detail_responsibilities(id_detail_roleresponsibilities);


--
-- Name: status fk_id_milostone; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_milostone FOREIGN KEY (id_milostone) REFERENCES project_charter.milostones(id_milostone);


--
-- Name: detail_responsibilities fk_id_responsibilities; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.detail_responsibilities
    ADD CONSTRAINT fk_id_responsibilities FOREIGN KEY (id_responsibilities) REFERENCES project_charter.role_responsibilities(id_responsibilities);


--
-- Name: status fk_id_responsibilities; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_responsibilities FOREIGN KEY (id_responsibilities) REFERENCES project_charter.role_responsibilities(id_responsibilities);


--
-- Name: status fk_id_responsibility; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_responsibility FOREIGN KEY (id_responsibility) REFERENCES project_charter.responsibility(id_responsibility);


--
-- Name: status fk_id_supporting; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_id_supporting FOREIGN KEY (id_supporting) REFERENCES project_charter.supporting_doc(id_supporting);


--
-- Name: project_charter fk_id_user; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.project_charter
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);


--
-- Name: approvedBy fk_id_user; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter."approvedBy"
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);


--
-- Name: deliverable fk_id_user; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.deliverable
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);


--
-- Name: description fk_id_user; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.description
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);


--
-- Name: detail_responsibilities fk_id_user; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.detail_responsibilities
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);


--
-- Name: milostones fk_id_user; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.milostones
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);


--
-- Name: responsibility fk_id_user; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.responsibility
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);


--
-- Name: role_responsibilities fk_id_user; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.role_responsibilities
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);


--
-- Name: supporting_doc fk_id_user; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.supporting_doc
    ADD CONSTRAINT fk_id_user FOREIGN KEY (id_user) REFERENCES internal_order."user"(id_user);


--
-- Name: status fk_status_id_description; Type: FK CONSTRAINT; Schema: project_charter; Owner: postgres
--

ALTER TABLE ONLY project_charter.status
    ADD CONSTRAINT fk_status_id_description FOREIGN KEY (id_description) REFERENCES project_charter.description(id_description);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         