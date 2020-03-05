--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: chefs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chefs (
    id integer NOT NULL,
    name text,
    created_at date
);


ALTER TABLE public.chefs OWNER TO postgres;

--
-- Name: chefs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chefs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chefs_id_seq OWNER TO postgres;

--
-- Name: chefs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chefs_id_seq OWNED BY public.chefs.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name text,
    path text NOT NULL
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipes (
    id integer NOT NULL,
    chef_id integer,
    title text,
    ingredients text[],
    preparation text[],
    information text,
    created_at date
);


ALTER TABLE public.recipes OWNER TO postgres;

--
-- Name: receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.receipts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receipts_id_seq OWNER TO postgres;

--
-- Name: receipts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.receipts_id_seq OWNED BY public.recipes.id;


--
-- Name: recipe_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recipe_files (
    id integer NOT NULL,
    recipe_id integer,
    file_id integer
);


ALTER TABLE public.recipe_files OWNER TO postgres;

--
-- Name: recipe_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recipe_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_files_id_seq OWNER TO postgres;

--
-- Name: recipe_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recipe_files_id_seq OWNED BY public.recipe_files.id;


--
-- Name: chefs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chefs ALTER COLUMN id SET DEFAULT nextval('public.chefs_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: recipe_files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_files ALTER COLUMN id SET DEFAULT nextval('public.recipe_files_id_seq'::regclass);


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.receipts_id_seq'::regclass);


--
-- Data for Name: chefs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chefs (id, name, created_at) FROM stdin;
3	Julia Kinoto	2020-02-23
4	Bairam Frootan	2020-02-23
5	Filipa Gaspar	2020-02-23
6	Marisa Labrone	2020-02-23
7	Mok Kwang	2020-02-23
9	Kendasha Wood	2020-02-23
10	Thenjiwe Msutu	2020-02-23
11	Uzoma Buci	2020-02-23
23	Helcio Itiyama	2020-02-25
27	Jos├® Quintero Montana	2020-03-02
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, name, path) FROM stdin;
295	1583362114477-lasanha2.png	public\\images\\1583362114477-lasanha2.png
306	1583405910851-asinhas.png	public\\images\\1583405910851-asinhas.png
296	1583362150253-asinhas2.png	public\\images\\1583362150253-asinhas2.png
298	1583362178417-lasanha2.png	public\\images\\1583362178417-lasanha2.png
299	1583362194564-chef.png	public\\images\\1583362194564-chef.png
307	1583405910861-asinhas2.png	public\\images\\1583405910861-asinhas2.png
308	1583405910904-lasanha2.png	public\\images\\1583405910904-lasanha2.png
300	1583362214682-burger.png	public\\images\\1583362214682-burger.png
309	1583405910877-burger.png	public\\images\\1583405910877-burger.png
291	1583333950871-lasanha.png	public\\images\\1583333950871-lasanha.png
301	1583367304148-asinhas.png	public\\images\\1583367304148-asinhas.png
310	1583406042257-asinhas.png	public\\images\\1583406042257-asinhas.png
302	1583367304244-asinhas2.png	public\\images\\1583367304244-asinhas2.png
311	1583406042283-asinhas2.png	public\\images\\1583406042283-asinhas2.png
293	1583333950821-asinhas.png	public\\images\\1583333950821-asinhas.png
304	1583367304330-burger.png	public\\images\\1583367304330-burger.png
312	1583406042341-lasanha2.png	public\\images\\1583406042341-lasanha2.png
294	1583333950847-asinhas2.png	public\\images\\1583333950847-asinhas2.png
303	1583367304372-lasanha.png	public\\images\\1583367304372-lasanha.png
313	1583406042326-lasanha.png	public\\images\\1583406042326-lasanha.png
305	1583367304380-lasanha2.png	public\\images\\1583367304380-lasanha2.png
314	1583406042295-burger.png	public\\images\\1583406042295-burger.png
\.


--
-- Data for Name: recipe_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipe_files (id, recipe_id, file_id) FROM stdin;
70	123	293
71	123	294
72	123	291
74	13	295
76	15	296
77	16	298
78	17	299
79	18	300
80	124	301
81	124	302
83	124	303
84	124	305
82	124	304
86	124	308
87	124	309
85	124	306
88	124	307
89	125	310
90	125	311
91	125	314
92	125	313
93	125	312
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recipes (id, chef_id, title, ingredients, preparation, information, created_at) FROM stdin;
13	3	Pizza 4 esta├º├Áes	{"1 x├¡cara (ch├í) de leite","1 ovo","1 colher (ch├í) de sal","1 colher (ch├í) de a├º├║car","1 colher (sopa) de margarina","1 e 1/2 x├¡cara (ch├í) de farinha de trigo","1 colher (sobremesa) de fermento em p├│","1/2 lata de molho de tomate","250 g de mussarela ralada grossa","2 tomates fatiados","azeitona picada","or├®gano a gosto"}	{"No liquidificador bata o leite, o ovo, o sal, o a├º├║car, a margarina, a farinha de trigo e o fermento em p├│ at├® que tudo esteja encorporado","Despeje a massa em uma assadeira para pizza untada com margarina e leve ao forno preaquecido por 20 minutos","Retire do forno e despeje o molho de tomate","Cubra a massa com mussarela ralada, tomate e or├®gano a gosto","Leve novamente ao forno at├® derreter a mussarela"}	Pizza de liquidificador ├® uma receita deliciosa e supersimples de preparar. Feita toda no liquidificador, ela ├® bem pr├ítica para o dia a dia. Aqui no TudoGostoso voc├¬ tamb├®m encontra diversas del├¡cias pr├íticas feitas no liquidificador: massa de panqueca, torta de frango de liquidificador, p├úo de queijo de liquidificador, bolo de banana, bolo de chocolate e muito mais!	2020-03-04
124	23	Pur├¬ de Batata	{"1 kg de batata","1/2 x├¡cara de leite"}	{"Cozinhe as batatas at├® ficarem bem moles."}	Preaque├ºa a chapa	2020-03-05
125	4	Strogonofre	{"1 kg de batata"}	{"Cozinhe as batatas at├® ficarem bem moles"}	Preaque├ºa a chapa, frigideira ou grelha por 10 minutos antes de levar os hamb├║rgueres. Adicione um pouquinho de ├│leo ou manteiga e n├úo amasse os hamb├║rgueres! <br><br> Voc├¬ sabia que a receita que precede o hamb├║rguer surgiu no s├®culo XIII, na Europa? A ideia de moer a carne chegou em Hamburgo no s├®culo XVII, onde um a├ºogueiro resolveu tamb├®m temper├í-la. Assim, a receita foi disseminada nos Estados Unidos por alem├úes da regi├úo. L├í surgiu a ideia de colocar o hamb├║rguer no meio do p├úo e adicionar outros ingredientes, como queijo tomates e alface.	2020-03-05
15	7	Asinhas de frango ao barbecue	{"2 colheres de sopa de farinha de trigo","1/2 x├¡cara (ch├í) de ├│leo","1 x├¡cara de molho barbecue"}	{"Em uma frigideira ou assador coloque o ├│leo quando estiver quente frite at├® ficarem douradas","Para servir fica bonito com salada, ou abuse da criatividade"}	""	2020-03-04
16	6	Lasanha mac n' cheese	{"massa pronta de lasanha","400 g de presunto","400 g de mussarela ralada","2 copos de requeij├úo","150 g de mussarela para gratinar"}	{"Em uma panela, coloque a manteiga para derreter","Acrescente a farinha de trigo e misture bem com aux├¡lio de um fouet","Adicione o leite e misture at├® formar um creme homog├¬neo","Tempere com sal, pimenta e noz-moscada a gosto","Desligue o fogo e acrescente o creme de leite, misture bem e reserve"}	Recheie a lasanha com o que preferir	2020-03-04
17	6	Espaguete ao alho	{"1 pacote de macarr├úo 500 g (tipo do macarr├úo a gosto)","1 saquinho de alho granulado","1/2 tablete de manteiga (n├úo use margarina)","1 colher (sopa) de azeite extra virgem","ervas (manjeric├úo, or├®gano, salsa, cebolinha, tomilho, a gosto)",sal,"1 dente de alho","gengibre em p├│ a gosto","1 folha de louro"}	{"Quando faltar mais ou menos 5 minutos para ficar no ponto de escorrer o macarr├úo, comece o preparo da receita","Na frigideira quente coloque a manteiga, o azeite, a folha de louro, e o alho granulado","Nesta hora um pouco de agilidade, pois o macarr├úo escorrido vai para a frigideira, sendo mexido e dosado com sal a gosto, as ervas, o gengibre em p├│ a gosto tamb├®m","O dente de alho, serve para voc├¬ untar os pratos onde ser├úo servidos o macarr├úo","Coloque as por├º├Áes nos pratos j├í com o cheiro do alho, e enfeite com algumas ervas"}	N├úo lave o macarr├úo nem passe ├│leo ou gordura nele depois de escorr├¬-lo. Coloque direto na frigideira	2020-03-04
18	9	Docinhos p├úo-do-c├®u	{"100 g de manteiga","3 ovos","1 pacote de coco seco ralado (100 g)","3 colheres (sopa) de a├º├║car 1 lata de Leite Mo├ºa","1 colher (sopa) de fermento em p├│","manteiga para untar","a├º├║car de confeiteiro"}	{"Descasque e passe pelo espremedor, ainda quente","Junte a manteiga,os ovos, o coco ralado,o a├º├║car, o Leite Mo├ºa e o fermento em p├│, mexendo bem ap├│s cada adi├º├úo","Despeje em assadeira retangular m├®dia, untada e leve ao forno m├®dio (180┬░C), por aproximadamente 45 minutos","Depois de frio, polvilhe, com o a├º├║car de confeiteiro e corte em quadrados"}	""	2020-03-04
123	3	Pur├¬ de Batata2	{"12 encontros de asinha de galinha, temperados a gosto"}	{"Cozinhe as batatas at├® ficarem bem moles."}	Preaque├ºa a chapa, frigideira ou grelha por 10 minutos antes de levar os hamb├║rgueres. Adicione um pouquinho de ├│leo ou manteiga e n├úo amasse os hamb├║rgueres! <br><br> Voc├¬ sabia que a receita que precede o hamb├║rguer surgiu no s├®culo XIII, na Europa? A ideia de moer a carne chegou em Hamburgo no s├®culo XVII, onde um a├ºogueiro resolveu tamb├®m temper├í-la. Assim, a receita foi disseminada nos Estados Unidos por alem├úes da regi├úo. L├í surgiu a ideia de colocar o hamb├║rguer no meio do p├úo e adicionar outros ingredientes, como queijo tomates e alface.	2020-03-04
\.


--
-- Name: chefs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chefs_id_seq', 28, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 314, true);


--
-- Name: receipts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.receipts_id_seq', 125, true);


--
-- Name: recipe_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recipe_files_id_seq', 93, true);


--
-- Name: chefs chefs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chefs
    ADD CONSTRAINT chefs_pkey PRIMARY KEY (id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: recipes receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT receipts_pkey PRIMARY KEY (id);


--
-- Name: recipe_files recipe_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_files
    ADD CONSTRAINT recipe_files_pkey PRIMARY KEY (id);


--
-- Name: recipe_files recipe_files_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_files
    ADD CONSTRAINT recipe_files_file_id_fkey FOREIGN KEY (file_id) REFERENCES public.files(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: recipe_files recipe_files_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recipe_files
    ADD CONSTRAINT recipe_files_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

