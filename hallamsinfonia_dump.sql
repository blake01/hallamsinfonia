--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO blake01;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO blake01;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO blake01;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO blake01;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO blake01;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO blake01;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO blake01;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO blake01;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO blake01;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO blake01;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO blake01;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO blake01;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO blake01;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO blake01;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO blake01;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO blake01;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO blake01;

--
-- Name: hallamsinfonia_concert; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE hallamsinfonia_concert (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    date_and_time timestamp with time zone NOT NULL,
    image_id integer NOT NULL,
    location_id integer NOT NULL,
    full_price_ticket_cost numeric(10,2) NOT NULL,
    booking_link character varying(200) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.hallamsinfonia_concert OWNER TO blake01;

--
-- Name: hallamsinfonia_concert_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE hallamsinfonia_concert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hallamsinfonia_concert_id_seq OWNER TO blake01;

--
-- Name: hallamsinfonia_concert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE hallamsinfonia_concert_id_seq OWNED BY hallamsinfonia_concert.id;


--
-- Name: hallamsinfonia_concessionaryticket; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE hallamsinfonia_concessionaryticket (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    ticket_cost numeric(10,2) NOT NULL,
    concert_id integer NOT NULL
);


ALTER TABLE public.hallamsinfonia_concessionaryticket OWNER TO blake01;

--
-- Name: hallamsinfonia_concessionaryticket_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE hallamsinfonia_concessionaryticket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hallamsinfonia_concessionaryticket_id_seq OWNER TO blake01;

--
-- Name: hallamsinfonia_concessionaryticket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE hallamsinfonia_concessionaryticket_id_seq OWNED BY hallamsinfonia_concessionaryticket.id;


--
-- Name: hallamsinfonia_conductor; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE hallamsinfonia_conductor (
    id integer NOT NULL,
    first_name character varying(128) NOT NULL,
    last_name character varying(128) NOT NULL,
    description text NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.hallamsinfonia_conductor OWNER TO blake01;

--
-- Name: hallamsinfonia_conductor_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE hallamsinfonia_conductor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hallamsinfonia_conductor_id_seq OWNER TO blake01;

--
-- Name: hallamsinfonia_conductor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE hallamsinfonia_conductor_id_seq OWNED BY hallamsinfonia_conductor.id;


--
-- Name: hallamsinfonia_image; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE hallamsinfonia_image (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    upload_date timestamp with time zone NOT NULL,
    image character varying(100) NOT NULL
);


ALTER TABLE public.hallamsinfonia_image OWNER TO blake01;

--
-- Name: hallamsinfonia_image_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE hallamsinfonia_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hallamsinfonia_image_id_seq OWNER TO blake01;

--
-- Name: hallamsinfonia_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE hallamsinfonia_image_id_seq OWNED BY hallamsinfonia_image.id;


--
-- Name: hallamsinfonia_location; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE hallamsinfonia_location (
    id integer NOT NULL,
    address_line_1 character varying(128) NOT NULL,
    address_line_2 character varying(128) NOT NULL,
    city character varying(128) NOT NULL,
    postcode character varying(8) NOT NULL
);


ALTER TABLE public.hallamsinfonia_location OWNER TO blake01;

--
-- Name: hallamsinfonia_location_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE hallamsinfonia_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hallamsinfonia_location_id_seq OWNER TO blake01;

--
-- Name: hallamsinfonia_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE hallamsinfonia_location_id_seq OWNED BY hallamsinfonia_location.id;


--
-- Name: hallamsinfonia_news; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE hallamsinfonia_news (
    id integer NOT NULL,
    pub_date date NOT NULL,
    title character varying(128) NOT NULL,
    content text NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE public.hallamsinfonia_news OWNER TO blake01;

--
-- Name: hallamsinfonia_news_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE hallamsinfonia_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hallamsinfonia_news_id_seq OWNER TO blake01;

--
-- Name: hallamsinfonia_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE hallamsinfonia_news_id_seq OWNED BY hallamsinfonia_news.id;


--
-- Name: hallamsinfonia_person; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE hallamsinfonia_person (
    id integer NOT NULL,
    first_name character varying(128) NOT NULL,
    last_name character varying(128) NOT NULL,
    concert_id integer NOT NULL,
    role character varying(128) NOT NULL
);


ALTER TABLE public.hallamsinfonia_person OWNER TO blake01;

--
-- Name: hallamsinfonia_person_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE hallamsinfonia_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hallamsinfonia_person_id_seq OWNER TO blake01;

--
-- Name: hallamsinfonia_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE hallamsinfonia_person_id_seq OWNED BY hallamsinfonia_person.id;


--
-- Name: hallamsinfonia_piece; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE hallamsinfonia_piece (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    composer character varying(128) NOT NULL,
    concert_id integer NOT NULL
);


ALTER TABLE public.hallamsinfonia_piece OWNER TO blake01;

--
-- Name: hallamsinfonia_piece_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE hallamsinfonia_piece_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hallamsinfonia_piece_id_seq OWNER TO blake01;

--
-- Name: hallamsinfonia_piece_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE hallamsinfonia_piece_id_seq OWNED BY hallamsinfonia_piece.id;


--
-- Name: hallamsinfonia_setting; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE hallamsinfonia_setting (
    id integer NOT NULL,
    about_the_orchestra text NOT NULL,
    about_image_1_id integer NOT NULL,
    about_image_2_id integer NOT NULL,
    about_image_3_id integer NOT NULL,
    quote_text character varying(256) NOT NULL,
    quote_source character varying(128) NOT NULL,
    facebook_link character varying(200) NOT NULL,
    twitter_link character varying(200) NOT NULL
);


ALTER TABLE public.hallamsinfonia_setting OWNER TO blake01;

--
-- Name: hallamsinfonia_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE hallamsinfonia_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hallamsinfonia_setting_id_seq OWNER TO blake01;

--
-- Name: hallamsinfonia_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE hallamsinfonia_setting_id_seq OWNED BY hallamsinfonia_setting.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: blake01; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO blake01;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: blake01
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO blake01;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: blake01
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_concert ALTER COLUMN id SET DEFAULT nextval('hallamsinfonia_concert_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_concessionaryticket ALTER COLUMN id SET DEFAULT nextval('hallamsinfonia_concessionaryticket_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_conductor ALTER COLUMN id SET DEFAULT nextval('hallamsinfonia_conductor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_image ALTER COLUMN id SET DEFAULT nextval('hallamsinfonia_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_location ALTER COLUMN id SET DEFAULT nextval('hallamsinfonia_location_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_news ALTER COLUMN id SET DEFAULT nextval('hallamsinfonia_news_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_person ALTER COLUMN id SET DEFAULT nextval('hallamsinfonia_person_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_piece ALTER COLUMN id SET DEFAULT nextval('hallamsinfonia_piece_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_setting ALTER COLUMN id SET DEFAULT nextval('hallamsinfonia_setting_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add log entry	6	add_logentry
17	Can change log entry	6	change_logentry
18	Can delete log entry	6	delete_logentry
19	Can add migration history	7	add_migrationhistory
20	Can change migration history	7	change_migrationhistory
21	Can delete migration history	7	delete_migrationhistory
22	Can add news	8	add_news
23	Can change news	8	change_news
24	Can delete news	8	delete_news
25	Can add conductor	9	add_conductor
26	Can change conductor	9	change_conductor
27	Can delete conductor	9	delete_conductor
28	Can add setting	10	add_setting
29	Can change setting	10	change_setting
30	Can delete setting	10	delete_setting
31	Can add image	11	add_image
32	Can change image	11	change_image
33	Can delete image	11	delete_image
34	Can add location	12	add_location
35	Can change location	12	change_location
36	Can delete location	12	delete_location
40	Can add concert	14	add_concert
41	Can change concert	14	change_concert
42	Can delete concert	14	delete_concert
43	Can add piece	15	add_piece
44	Can change piece	15	change_piece
45	Can delete piece	15	delete_piece
46	Can add concessionary ticket	16	add_concessionaryticket
47	Can change concessionary ticket	16	change_concessionaryticket
48	Can delete concessionary ticket	16	delete_concessionaryticket
49	Can add person	17	add_person
50	Can change person	17	change_person
51	Can delete person	17	delete_person
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('auth_permission_id_seq', 51, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$12000$BK6IYZUOdbP7$AL7jjX9gdfqXQ7ps+JBs8NVVXq8i1i+a7tdlstVdcLw=	2014-02-23 22:22:37.862677+00	t	blake			blakehemingway@gmail.com	t	t	2014-01-28 11:15:31.357478+00
2	pbkdf2_sha256$12000$lg3zr6uxMCa0$ELRSTPDSV+8Bz+oGwr6ahYv5TC4EemOb2sYSfC/LNX8=	2014-02-28 23:11:07.189962+00	t	gareth.widdowson	Gareth	Widdowson		t	t	2014-02-25 14:36:05+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
2	2014-02-23 09:28:04.87247+00	1	9	1	Natalia  Luis-Bassa	1	
3	2014-02-23 11:04:29.396835+00	1	11	1	Concert 1	1	
4	2014-02-23 11:05:06.275955+00	1	12	1	Ecclesall Parish Church, Sheffield	1	
5	2014-02-23 11:05:47.935364+00	1	14	1	A test concert on 28 February	1	
6	2014-02-23 15:02:00.90256+00	1	11	2	Concert 2	1	
7	2014-02-23 15:03:14.701449+00	1	11	3	Concert 3	1	
8	2014-02-23 15:03:26.023745+00	1	11	4	Concert 4	1	
9	2014-02-23 15:03:32.882265+00	1	11	5	About 1	1	
10	2014-02-23 15:03:40.094784+00	1	11	6	About 2	1	
11	2014-02-23 15:03:47.288168+00	1	11	7	About 3	1	
12	2014-02-23 15:46:54.208131+00	1	8	1	News Story 1 - 2014-02-23	1	
13	2014-02-23 15:47:06.082344+00	1	8	2	Old - 2014-02-02	1	
14	2014-02-23 15:52:45.748697+00	1	10	2	Settings, Defaults and Parameters	2	Changed quote_text and quote_source.
15	2014-02-23 16:21:45.215594+00	1	10	2	Settings, Defaults and Parameters	2	Changed about_the_orchestra.
16	2014-02-23 16:31:20.140454+00	1	8	1	News Story 1 - 2014-02-22	2	Changed pub_date.
17	2014-02-23 16:32:03.379282+00	1	8	1	News Story 1 - 2014-02-23	2	Changed pub_date.
18	2014-02-23 16:33:30.432968+00	1	8	1	News Story 1 - 2014-02-22	2	Changed pub_date.
19	2014-02-23 16:34:38.633386+00	1	8	1	News Story 1 - 2014-02-23	2	Changed pub_date.
20	2014-02-23 16:35:59.243725+00	1	8	3	Another - 2014-02-23	1	
21	2014-02-23 16:36:13.718089+00	1	8	4	Again - 2014-02-11	1	
22	2014-02-23 16:36:30.917269+00	1	8	5	Merry Christmas - 2013-12-25	1	
23	2014-02-23 16:38:04.081324+00	1	8	1	News Story 1 - 2014-02-23	2	Changed image.
24	2014-02-23 20:24:42.384265+00	1	9	2	Gareth Widdowson	1	
25	2014-02-23 20:24:54.977154+00	1	9	2	Gareth Widdowson	2	Changed listed_on_conductors_page.
26	2014-02-23 21:16:07.755931+00	1	10	2	Settings, Defaults and Parameters	2	Changed about_the_orchestra.
27	2014-02-23 21:16:27.380188+00	1	10	2	Settings, Defaults and Parameters	2	Changed about_the_orchestra.
28	2014-02-23 22:22:59.097823+00	1	8	3	Another - 2014-02-23	3	
29	2014-02-23 22:22:59.108871+00	1	8	4	Again - 2014-02-11	3	
30	2014-02-23 22:22:59.109618+00	1	8	2	Old - 2014-02-02	3	
31	2014-02-23 22:22:59.110279+00	1	8	5	Merry Christmas - 2013-12-25	3	
32	2014-02-25 14:36:05.631278+00	1	3	2	Gareth	1	
33	2014-02-25 14:36:10.689592+00	1	3	2	Gareth	2	Changed is_staff and is_superuser.
34	2014-02-25 14:37:10.133152+00	1	11	8	Concert Img 1	1	
35	2014-02-25 14:37:39.660818+00	1	14	2	Test Concert on 04 April	1	
36	2014-02-25 14:38:01.560469+00	1	8	1	News Story 1 - 2014-02-23	2	Changed image.
37	2014-02-25 14:38:32.156755+00	1	11	3	Concert 3	3	
38	2014-02-25 14:38:32.158332+00	1	11	2	Concert 2	3	
39	2014-02-25 14:38:32.159082+00	1	11	1	Concert 1	3	
40	2014-02-25 14:38:42.260824+00	1	10	2	Settings, Defaults and Parameters	2	Changed about_image_1, about_image_2 and about_image_3.
41	2014-02-25 14:38:52.371365+00	1	11	7	About 3	3	
42	2014-02-25 14:38:52.372836+00	1	11	6	About 2	3	
43	2014-02-25 14:38:52.37372+00	1	11	5	About 1	3	
44	2014-02-25 14:38:52.374486+00	1	11	4	Concert 4	3	
45	2014-02-25 14:39:15.552311+00	1	9	2	Gareth Widdowson	2	Changed image.
46	2014-02-25 16:17:46.741828+00	2	3	2	Gareth	2	Changed password.
47	2014-02-25 16:18:00.639956+00	2	3	2	gareth.widdowson	2	Changed username, first_name and last_name.
48	2014-02-25 16:19:15.955173+00	2	14	2	Test Concert on 04 April	2	Changed conductors.
49	2014-02-25 16:22:24.982677+00	2	11	9	St. Cecilia	1	
50	2014-02-25 16:22:38.686589+00	2	11	10	Elgar	1	
51	2014-02-25 16:22:53.153109+00	2	11	11	Horn	1	
52	2014-02-25 16:28:03.868959+00	2	14	2	Tchaikovsky: Symphony no.4 on 05 October	2	Changed title, date_and_time, conductors and description. Added concessionary ticket "Concession". Added concessionary ticket "Student". Added concessionary ticket "Under 18". Added piece "Willow Song and Ave Maria from Otello". Added piece "Prelude and Transfiguration from Tristan ind Isolde". Added piece "Symphony no.4". Changed title and composer for piece "Prelude and Ritorna Vincitor from Aida".
53	2014-02-25 16:29:08.956534+00	2	12	2	High Storrs School, Sheffield	1	
54	2014-02-25 16:31:17.815016+00	2	14	3	St. Cecilia Mass on 23 November	1	
55	2014-02-25 16:32:50.200824+00	2	14	4	Variations on 08 March	1	
56	2014-02-25 16:34:46.987478+00	2	14	5	Symphonie Fantastique on 10 May	1	
57	2014-02-25 16:35:00.173844+00	2	9	2	Gareth Widdowson	3	
58	2014-02-25 16:36:25.680214+00	2	11	12	Tim Horton	1	
59	2014-02-25 16:36:27.922975+00	2	8	1	Tim Horton to do Beethoven Cycle - 2013-12-01	2	Changed pub_date, title, content and image.
60	2014-02-25 16:37:49.880512+00	2	11	13	Brass	1	
61	2014-02-25 16:38:07.948276+00	2	11	14	Bassoon	1	
62	2014-02-25 16:38:21.588916+00	2	11	15	Orchestra	1	
63	2014-02-25 16:38:23.153912+00	2	10	2	Settings, Defaults and Parameters	2	Changed about_image_1, about_image_2 and about_image_3.
64	2014-02-28 19:17:17.076416+00	2	14	2	Tchaikovsky: Symphony no.4 on Saturday 05 October 13	2	Added person "Sarah Estill". Added person "Richard Laing".
65	2014-02-28 19:19:23.205189+00	2	14	4	Enigma Variations & Don Quixote on Saturday 08 March 14	2	Changed title. Added person "Richard Jenkinson". Added person "Louise Williams". Added person "Natalia Luis-Bassa".
66	2014-02-28 19:19:35.952655+00	2	14	3	St. Cecilia Mass on Saturday 23 November 13	2	Added person "Peter Taylor".
67	2014-02-28 19:19:50.160845+00	2	14	5	Symphonie Fantastique on Saturday 10 May 14	2	Added person "Natalia Luis-Bassa".
68	2014-02-28 23:11:43.59405+00	2	14	5	Symphonie Fantastique on Saturday 10 May 14	2	Changed date_and_time.
69	2014-03-02 15:55:02.529194+00	2	9	1	Natalia  Luis-Bassa	2	Changed description and image.
70	2014-03-02 15:56:36.783957+00	2	9	1	Natalia  Luis-Bassa	2	Changed description.
71	2014-03-02 15:57:26.85434+00	2	9	1	Natalia  Luis-Bassa	2	Changed description.
72	2014-03-03 17:10:04.966667+00	2	8	1	Tim Horton to do Beethoven Cycle - 2013-12-01	2	Changed content.
73	2014-03-03 17:11:54.430725+00	2	8	1	Tim Horton to do Beethoven Cycle - 2013-12-01	2	Changed content.
74	2014-03-03 17:12:13.200252+00	2	8	1	Tim Horton to do Beethoven Cycle - 2013-12-01	2	Changed content.
75	2014-03-03 17:12:21.68068+00	2	8	1	Tim Horton to do Beethoven Cycle - 2013-12-01	2	Changed content.
76	2014-03-03 17:19:04.584867+00	2	8	1	Tim Horton to do Beethoven Cycle - 2013-12-01	2	No fields changed.
77	2014-03-03 17:25:26.707583+00	2	8	1	Tim Horton to do Beethoven Cycle - 2013-12-01	2	Changed content.
78	2014-03-03 17:28:03.306631+00	2	10	2	Settings, Defaults and Parameters	2	Changed about_the_orchestra, facebook_link and twitter_link.
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 78, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	permission	auth	permission
2	group	auth	group
3	user	auth	user
4	content type	contenttypes	contenttype
5	session	sessions	session
6	log entry	admin	logentry
7	migration history	south	migrationhistory
8	news	hallamsinfonia	news
9	conductor	hallamsinfonia	conductor
10	setting	hallamsinfonia	setting
11	image	hallamsinfonia	image
12	location	hallamsinfonia	location
14	concert	hallamsinfonia	concert
15	piece	hallamsinfonia	piece
16	concessionary ticket	hallamsinfonia	concessionaryticket
17	person	hallamsinfonia	person
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('django_content_type_id_seq', 17, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
dbg0n3sla7gpfz9rxal7582pfdmkru5v	M2Y3NDNkNDY3N2E2Njk5YTFjYzliN2FlNzgxNmY0YzZjMTQ3Y2U4ODqAAn1xAVgKAAAAdGVzdGNvb2tpZXECWAYAAAB3b3JrZWRxA3Mu	2014-02-11 11:16:11.543802+00
c8o6zrl26t4mumgqbv6ehzsicsyg8txf	Yjc5MmQwNGMxNmUyNGU3MmNjZGNmNjE3M2M5MGM3YWM0NjQ2ZWE1Nzp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiIsIl9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2014-03-09 20:36:04.416477+00
e8cubopuocx2jz188txgdq9v3p1sosac	YzUwNDMxMWFhY2JiODFlOWY5ZDVlMzc1N2M4NTdhNmE5NzgzZmEzMjp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiJ9	2014-03-09 20:37:16.804295+00
3dq9g856cy7d93uxy5alpl1zflazjyvx	YzUwNDMxMWFhY2JiODFlOWY5ZDVlMzc1N2M4NTdhNmE5NzgzZmEzMjp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiJ9	2014-03-09 21:30:39.854812+00
8bzr6updg7szsb9vku4wae914nzcy1iv	YzUwNDMxMWFhY2JiODFlOWY5ZDVlMzc1N2M4NTdhNmE5NzgzZmEzMjp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiJ9	2014-03-09 21:32:52.563551+00
iyj1cwcdb6nq9x6iwww9mdh2469ptrfs	OGFkNTFlOTBjMDY5NGE1ZjRkMmMxNGVmMDMyZmFkOGQ5ZDg3NWIyZTp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-03-09 22:22:37.864475+00
saj6y7mhqml601mui4goxw1xpp0tjju6	YzUwNDMxMWFhY2JiODFlOWY5ZDVlMzc1N2M4NTdhNmE5NzgzZmEzMjp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiJ9	2014-03-10 00:08:55.71651+00
5ki0deqqdbp7478ou4ttdji8osr7e0ov	YzUwNDMxMWFhY2JiODFlOWY5ZDVlMzc1N2M4NTdhNmE5NzgzZmEzMjp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiJ9	2014-03-11 15:20:52.036902+00
a1r6osatz6yeyj7xtxlnudj36h2al0uf	MmE4NTAyZDQxNjYyNjZhY2MzNjE1YTVmNzBlYzQzZGI2M2ExYjQ2Yjp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-03-11 16:17:25.171443+00
kxxrpq5ldw5bo3ssz1i0iaggedql0gii	YzUwNDMxMWFhY2JiODFlOWY5ZDVlMzc1N2M4NTdhNmE5NzgzZmEzMjp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiJ9	2014-03-11 20:22:37.160574+00
08ztgfqrifbem0c4t9og0uvwdpjy30u6	YzUwNDMxMWFhY2JiODFlOWY5ZDVlMzc1N2M4NTdhNmE5NzgzZmEzMjp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiJ9	2014-03-11 23:53:23.122545+00
kn2dodvr9x2o6y9atqssjloipzryncjf	YzUwNDMxMWFhY2JiODFlOWY5ZDVlMzc1N2M4NTdhNmE5NzgzZmEzMjp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiJ9	2014-03-13 18:16:56.794459+00
uqvqpsgzudtj7w9tdvihgg0wk5h3yz2v	YzUwNDMxMWFhY2JiODFlOWY5ZDVlMzc1N2M4NTdhNmE5NzgzZmEzMjp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiJ9	2014-03-14 10:51:22.475979+00
rx6mjfxmcdpebyugmnt8h1brq9vftb1i	YzUwNDMxMWFhY2JiODFlOWY5ZDVlMzc1N2M4NTdhNmE5NzgzZmEzMjp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiJ9	2014-03-14 12:10:56.142928+00
p63p8dth0dm34n6xd7dvr2jhl8u1t6xt	YzUwNDMxMWFhY2JiODFlOWY5ZDVlMzc1N2M4NTdhNmE5NzgzZmEzMjp7ImxvY2tkb3duLWFsbG93IjoiajI5X2RldiJ9	2014-03-14 12:11:40.104056+00
2v30dvejrbmvmcuy22z7zlpbq56m8huh	NWIwMzVhZWE0NmRhNjc5MzNlNDQzMDM3MmM3NTA2N2JhYTlkMDdjMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-03-14 19:15:30.774665+00
p98qso6n0b3hv6ttgca3lei79du2n03k	NWIwMzVhZWE0NmRhNjc5MzNlNDQzMDM3MmM3NTA2N2JhYTlkMDdjMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6Mn0=	2014-03-14 23:11:07.231925+00
\.


--
-- Data for Name: hallamsinfonia_concert; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY hallamsinfonia_concert (id, title, date_and_time, image_id, location_id, full_price_ticket_cost, booking_link, description) FROM stdin;
2	Tchaikovsky: Symphony no.4	2013-10-05 18:30:00+00	8	1	10.00		“all life is an unbroken alternation of hard reality with swiftly passing dreams and visions of happiness”\r\n\r\nTchaikovsky expresses these words to explain the first movement of his fourth symphony, and his obsession with fate and his resignation to it is no better manifested in music than here.  “ Drift upon that sea until it engulfs and submerges you in its depths” - Take his advice and let him take you on an emotional journey through tragic lows to ecstatic highs in this wonderful symphony.
4	Enigma Variations & Don Quixote	2014-03-08 19:30:00+00	10	2	10.00		Richard Strauss’s Don Quixote, a musical dramatisation of  Cervantes’s 17th century novel about a slightly insane noble man’s imaginary life as a Knight, is one of his finest symphonic tone poems. Through a set of fantastic variations and thematic development, the listener is taken on this journey with the Don.\r\n\r\nHallam Sinfonia are delighted to welcome back Richard Jenkinson (CBSO), along with Louise Latham (CBSO) who makes her debut with the orchestra, \r\n\r\nElgar’s Enigma Variations is most famous for ‘Nimrod’ which has now achieved anthem status, however the set of variations is one of his finest orchestral works. His friendships and relationships are the affectionate subjects of the variations, which were given the title ‘Enigma’ to disguise the identities of these people.
3	St. Cecilia Mass	2013-11-23 19:30:00+00	9	1	12.00	http://www.hallamchoralsociety.co.uk/	Hallam Sinfonia are joining forces with the Hallam Choral Society for a joint celebration of Benjamin Britten’s 100th Birthday and St. Cecilia’s Day (patron saint of music).\r\n\r\n<i>“This simplicity, this grandeur, this serene light which rose before the musical world like a breaking dawn, troubled people enormously… at first one was dazzled, then charmed, then conquered.”</i>\r\nCamile Saint-Saëns (about Gounod’s St. Cecilia Mass).\r\n\r\n<b>The Hallam Choral Society</b> is an established choir striving towards excellence in performance. Membership is diverse and currently at over eighty singers from across the city and beyond to perform around four public concerts a year with an eclectic mix of music.\r\n\r\n* This concert is organised by the Hallam Choral Society. Tickets should be booked using through them directly, or on the door.\r\n
5	Symphonie Fantastique	2014-05-10 19:30:00+00	11	2	10.00		Autobiography and hallucination merge in Berlioz’s Symphonie Fantastique - a musical incarnation of his love and affection of art and the British actress he fell madly in love with (and who eventually married him).\r\n\r\nBerlioz said that he composed the “March to the Scaffold” in a single fevered night, but struggled with other sections for months. In the end, he produced a monument of the symphonic repertory. 
\.


--
-- Name: hallamsinfonia_concert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('hallamsinfonia_concert_id_seq', 5, true);


--
-- Data for Name: hallamsinfonia_concessionaryticket; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY hallamsinfonia_concessionaryticket (id, name, ticket_cost, concert_id) FROM stdin;
1	Concession	8.00	2
2	Student	5.00	2
3	Under 18	3.00	2
4	Concession	10.00	3
5	Student	5.00	3
6	Concessions	8.00	4
7	Student	5.00	4
8	Under 18	3.00	4
9	Concessions	10.00	5
10	Student	5.00	5
11	Under 18	3.00	5
\.


--
-- Name: hallamsinfonia_concessionaryticket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('hallamsinfonia_concessionaryticket_id_seq', 11, true);


--
-- Data for Name: hallamsinfonia_conductor; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY hallamsinfonia_conductor (id, first_name, last_name, description, image) FROM stdin;
1	Natalia 	Luis-Bassa	Natalia Luis-Bassa is currently Musical Director of the Haffner Orchestra in Lancaster and the Hallam Sinfonia in Sheffield. \r\n\r\nThe Venezuelan conductor began her musical studies at the world famous El Sistema where she studied Oboe. She read music at the University Institute of Musical Studies (IUDEM), an institution that belongs to the Venezuelan musical system, being the first person to obtain a degree in Orchestral Conducting in her native country.\r\n\r\nNatalia holds a Master's Degree from The University of Huddersfield where she is a part-time lecturer and has been appointed Elgar Ambassador.\r\n\r\nA close collaborator of the National Children's Orchestras of Great Britain, Natalia is now Music Director of the London Regional Orchestra.\r\n\r\nShe completed her Postgraduates studies at the Royal College of Music in London, holding the RCM Junior Fellowship in Opera Conducting for two years. Her relationship with the RCM continues even now, as she has been appointed Professor of Conducting and has recently starting to pursuing her Doctorate studies.\r\n\r\nTwitter - @NataliaLuisB\r\nFacebook.com/natalialuisbassa	conductors/Natalia.jpg
\.


--
-- Name: hallamsinfonia_conductor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('hallamsinfonia_conductor_id_seq', 2, true);


--
-- Data for Name: hallamsinfonia_image; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY hallamsinfonia_image (id, title, upload_date, image) FROM stdin;
8	Concert Img 1	2014-02-25 14:37:10.048598+00	image_library/concert_1.jpg
9	St. Cecilia	2014-02-25 16:22:24.905785+00	image_library/Concert_2.jpg
10	Elgar	2014-02-25 16:22:38.615743+00	image_library/Concert_3.jpg
11	Horn	2014-02-25 16:22:53.087135+00	image_library/Concert_4.jpg
12	Tim Horton	2014-02-25 16:36:25.6147+00	image_library/News1.jpg
13	Brass	2014-02-25 16:37:49.819927+00	image_library/About_pic_1.jpg
14	Bassoon	2014-02-25 16:38:07.888554+00	image_library/About_pic_2.jpg
15	Orchestra	2014-02-25 16:38:21.527944+00	image_library/About_pic_3.jpg
\.


--
-- Name: hallamsinfonia_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('hallamsinfonia_image_id_seq', 15, true);


--
-- Data for Name: hallamsinfonia_location; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY hallamsinfonia_location (id, address_line_1, address_line_2, city, postcode) FROM stdin;
1	Ecclesall Parish Church	Ringinglow Road	Sheffield	S11 7PP
2	High Storrs School	High Storrs Rd	Sheffield	S11 7LH
\.


--
-- Name: hallamsinfonia_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('hallamsinfonia_location_id_seq', 2, true);


--
-- Data for Name: hallamsinfonia_news; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY hallamsinfonia_news (id, pub_date, title, content, image_id) FROM stdin;
1	2013-12-01	Tim Horton to do Beethoven Cycle	As part of our 2014-15 season planning, we are pleased to announce that Tim Horton, from Ensemble 360, will be performing for a new cycle of Beethoven Piano Concertos with us to complement our continuing Beethoven Symphonies cycle.\r\n\r\nTim performed with us last season for a touching performance of Rachmaninov's Piano Concerto no.2, and the orchestra are delighted to have him back for this new cycle.\r\n\r\nNews of next season, and what concerts Tim will be playing in, will be online in the near future.\r\n\r\n3 March 2014	12
\.


--
-- Name: hallamsinfonia_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('hallamsinfonia_news_id_seq', 5, true);


--
-- Data for Name: hallamsinfonia_person; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY hallamsinfonia_person (id, first_name, last_name, concert_id, role) FROM stdin;
1	Sarah	Estill	2	Soprano
2	Richard	Laing	2	Conductor
3	Richard	Jenkinson	4	cello
4	Louise	Williams	4	viola
5	Natalia	Luis-Bassa	4	conductor
6	Peter	Taylor	3	conductor
7	Natalia	Luis-Bassa	5	conductor
\.


--
-- Name: hallamsinfonia_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('hallamsinfonia_person_id_seq', 7, true);


--
-- Data for Name: hallamsinfonia_piece; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY hallamsinfonia_piece (id, title, composer, concert_id) FROM stdin;
3	Prelude and Ritorna Vincitor from Aida	Verdi	2
4	Willow Song and Ave Maria from Otello	Verdi	2
5	Prelude and Transfiguration from Tristan ind Isolde	Wagner	2
6	Symphony no.4	Tchaikovsky	2
7	World of the Spirit	Britten	3
8	St. Cecilia Mass	Gounod	3
9	Don Quixote	Strauss	4
10	Enigma Variations	Elgar	4
11	Incidental music to Shakespeare's A Midsummer Night's Dream	Mendelssohn	5
12	A Winter Fantasia	Gareth Widdowson	5
13	Symphonie Fantastique	Berlioz	5
\.


--
-- Name: hallamsinfonia_piece_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('hallamsinfonia_piece_id_seq', 13, true);


--
-- Data for Name: hallamsinfonia_setting; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY hallamsinfonia_setting (id, about_the_orchestra, about_image_1_id, about_image_2_id, about_image_3_id, quote_text, quote_source, facebook_link, twitter_link) FROM stdin;
2	The Hallam Sinfonia was originally set up as a chamber orchestra by a group of local peripatetic music teachers. Although no longer a chamber orchestra, last year’s 40th anniversary concert repeated some of the works performed at the very first concert in 1973: Mozart’s Marriage of Figaro overture and Beethoven’s 1st symphony, and the players included several founder members, including the current leader, John Cooper.\r\n\r\nThe orchestra can be flexible and adaptable and has recently supported the Hallam Choral Society and Tideswell Singers in a choral concert and performed Prokofiev’s Peter and the Wolf in a village church in Rotherham District. The latter was conducted by our recently appointed Assistant Conductor, Gavin Usher, who can also often be found playing in the first violin section, while the narrator was a moonlighting cellist.\r\n\r\nAnother of Natalia’s special interests is Berlioz, and our final concert this season, in May, will include his Symphonie Fantastique, as well as a new work by a member of the orchestra. Planning for the 2014-15 season is under way and includes continuing a cycle of Beethoven symphonies, complemented by a new cycle of Beethoven piano concertos with Tim Horton of Ensemble 360.\r\n	13	14	15	The orchestral sound is measured, balanced and played with such enthusiasm and spirit. 	Helen McRay, email 2013	http://www.facebook.com/hallamsinfonia	http://www.twitter.com/hallamsinfonia
\.


--
-- Name: hallamsinfonia_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('hallamsinfonia_setting_id_seq', 2, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: blake01
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	hallamsinfonia	0001_initial	2014-02-23 22:17:04.87719+00
2	hallamsinfonia	0002_auto__add_setting__add_location__add_concessionaryticket__add_news__ad	2014-02-23 22:17:04.935418+00
3	hallamsinfonia	0003_auto__add_field_setting_live_season__del_field_season_live	2014-02-23 22:17:04.954484+00
4	hallamsinfonia	0004_auto__del_season__del_field_setting_live_season	2014-02-28 12:47:46.240226+00
5	hallamsinfonia	0005_auto__add_person__del_field_conductor_listed_on_conductors_page	2014-02-28 13:10:11.696898+00
6	hallamsinfonia	0006_auto__add_field_person_role	2014-02-28 13:10:11.756671+00
7	hallamsinfonia	0007_auto__add_field_setting_facebook_link__add_field_setting_twitter_link	2014-02-28 18:04:52.099031+00
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: blake01
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 7, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: hallamsinfonia_concert_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY hallamsinfonia_concert
    ADD CONSTRAINT hallamsinfonia_concert_pkey PRIMARY KEY (id);


--
-- Name: hallamsinfonia_concessionaryticket_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY hallamsinfonia_concessionaryticket
    ADD CONSTRAINT hallamsinfonia_concessionaryticket_pkey PRIMARY KEY (id);


--
-- Name: hallamsinfonia_conductor_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY hallamsinfonia_conductor
    ADD CONSTRAINT hallamsinfonia_conductor_pkey PRIMARY KEY (id);


--
-- Name: hallamsinfonia_image_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY hallamsinfonia_image
    ADD CONSTRAINT hallamsinfonia_image_pkey PRIMARY KEY (id);


--
-- Name: hallamsinfonia_location_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY hallamsinfonia_location
    ADD CONSTRAINT hallamsinfonia_location_pkey PRIMARY KEY (id);


--
-- Name: hallamsinfonia_news_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY hallamsinfonia_news
    ADD CONSTRAINT hallamsinfonia_news_pkey PRIMARY KEY (id);


--
-- Name: hallamsinfonia_person_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY hallamsinfonia_person
    ADD CONSTRAINT hallamsinfonia_person_pkey PRIMARY KEY (id);


--
-- Name: hallamsinfonia_piece_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY hallamsinfonia_piece
    ADD CONSTRAINT hallamsinfonia_piece_pkey PRIMARY KEY (id);


--
-- Name: hallamsinfonia_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY hallamsinfonia_setting
    ADD CONSTRAINT hallamsinfonia_setting_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: blake01; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: hallamsinfonia_concert_image_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX hallamsinfonia_concert_image_id ON hallamsinfonia_concert USING btree (image_id);


--
-- Name: hallamsinfonia_concert_location_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX hallamsinfonia_concert_location_id ON hallamsinfonia_concert USING btree (location_id);


--
-- Name: hallamsinfonia_concessionaryticket_concert_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX hallamsinfonia_concessionaryticket_concert_id ON hallamsinfonia_concessionaryticket USING btree (concert_id);


--
-- Name: hallamsinfonia_news_image_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX hallamsinfonia_news_image_id ON hallamsinfonia_news USING btree (image_id);


--
-- Name: hallamsinfonia_person_concert_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX hallamsinfonia_person_concert_id ON hallamsinfonia_person USING btree (concert_id);


--
-- Name: hallamsinfonia_piece_concert_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX hallamsinfonia_piece_concert_id ON hallamsinfonia_piece USING btree (concert_id);


--
-- Name: hallamsinfonia_setting_about_image_1_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX hallamsinfonia_setting_about_image_1_id ON hallamsinfonia_setting USING btree (about_image_1_id);


--
-- Name: hallamsinfonia_setting_about_image_2_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX hallamsinfonia_setting_about_image_2_id ON hallamsinfonia_setting USING btree (about_image_2_id);


--
-- Name: hallamsinfonia_setting_about_image_3_id; Type: INDEX; Schema: public; Owner: blake01; Tablespace: 
--

CREATE INDEX hallamsinfonia_setting_about_image_3_id ON hallamsinfonia_setting USING btree (about_image_3_id);


--
-- Name: about_image_1_id_refs_id_106d7739; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_setting
    ADD CONSTRAINT about_image_1_id_refs_id_106d7739 FOREIGN KEY (about_image_1_id) REFERENCES hallamsinfonia_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: about_image_2_id_refs_id_106d7739; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_setting
    ADD CONSTRAINT about_image_2_id_refs_id_106d7739 FOREIGN KEY (about_image_2_id) REFERENCES hallamsinfonia_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: about_image_3_id_refs_id_106d7739; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_setting
    ADD CONSTRAINT about_image_3_id_refs_id_106d7739 FOREIGN KEY (about_image_3_id) REFERENCES hallamsinfonia_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: concert_id_refs_id_0e6eaa56; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_piece
    ADD CONSTRAINT concert_id_refs_id_0e6eaa56 FOREIGN KEY (concert_id) REFERENCES hallamsinfonia_concert(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: concert_id_refs_id_638ae92d; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_person
    ADD CONSTRAINT concert_id_refs_id_638ae92d FOREIGN KEY (concert_id) REFERENCES hallamsinfonia_concert(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: concert_id_refs_id_fb428b03; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_concessionaryticket
    ADD CONSTRAINT concert_id_refs_id_fb428b03 FOREIGN KEY (concert_id) REFERENCES hallamsinfonia_concert(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: image_id_refs_id_020fdf10; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_news
    ADD CONSTRAINT image_id_refs_id_020fdf10 FOREIGN KEY (image_id) REFERENCES hallamsinfonia_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: image_id_refs_id_09d60e7a; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_concert
    ADD CONSTRAINT image_id_refs_id_09d60e7a FOREIGN KEY (image_id) REFERENCES hallamsinfonia_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: location_id_refs_id_2e8d81ce; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY hallamsinfonia_concert
    ADD CONSTRAINT location_id_refs_id_2e8d81ce FOREIGN KEY (location_id) REFERENCES hallamsinfonia_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: blake01
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

