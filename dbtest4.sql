PGDMP     ,    5                |           dbtest4    15.7 (Debian 15.7-0+deb12u1)    15.7 (Debian 15.7-0+deb12u1) '    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16400    dbtest4    DATABASE     s   CREATE DATABASE dbtest4 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_GB.UTF-8';
    DROP DATABASE dbtest4;
                testusr    false            �            1259    16402 	   companies    TABLE     S   CREATE TABLE public.companies (
    id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE public.companies;
       public         heap    testusr    false            �            1259    16401    companies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.companies_id_seq;
       public          testusr    false    215            �           0    0    companies_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;
          public          testusr    false    214            �            1259    16446    referral_requests    TABLE     �  CREATE TABLE public.referral_requests (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    title text NOT NULL,
    content text NOT NULL,
    referrer_user_id integer NOT NULL,
    company_id integer,
    referee_client text NOT NULL,
    referee_client_email text NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status text DEFAULT 'pending'::text NOT NULL
);
 %   DROP TABLE public.referral_requests;
       public         heap    testusr    false            �            1259    16445    referral_requests_id_seq    SEQUENCE     �   CREATE SEQUENCE public.referral_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.referral_requests_id_seq;
       public          testusr    false    221            �           0    0    referral_requests_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.referral_requests_id_seq OWNED BY public.referral_requests.id;
          public          testusr    false    220            �            1259    16429    sessions    TABLE     �   CREATE TABLE public.sessions (
    id integer NOT NULL,
    session_id text NOT NULL,
    user_id integer NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.sessions;
       public         heap    testusr    false            �            1259    16428    sessions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sessions_id_seq;
       public          testusr    false    219            �           0    0    sessions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;
          public          testusr    false    218            �            1259    16413    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    role text NOT NULL,
    company_id integer
);
    DROP TABLE public.users;
       public         heap    testusr    false            �            1259    16412    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          testusr    false    217            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          testusr    false    216                       2604    16405    companies id    DEFAULT     l   ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);
 ;   ALTER TABLE public.companies ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    214    215    215                       2604    16449    referral_requests id    DEFAULT     |   ALTER TABLE ONLY public.referral_requests ALTER COLUMN id SET DEFAULT nextval('public.referral_requests_id_seq'::regclass);
 C   ALTER TABLE public.referral_requests ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    221    220    221                       2604    16432    sessions id    DEFAULT     j   ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    218    219    219                       2604    16416    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          testusr    false    216    217    217            �          0    16402 	   companies 
   TABLE DATA           -   COPY public.companies (id, name) FROM stdin;
    public          testusr    false    215   b-       �          0    16446    referral_requests 
   TABLE DATA           �   COPY public.referral_requests (id, username, title, content, referrer_user_id, company_id, referee_client, referee_client_email, created_at, status) FROM stdin;
    public          testusr    false    221   �-       �          0    16429    sessions 
   TABLE DATA           S   COPY public.sessions (id, session_id, user_id, expires_at, created_at) FROM stdin;
    public          testusr    false    219   .       �          0    16413    users 
   TABLE DATA           P   COPY public.users (id, email, username, password, role, company_id) FROM stdin;
    public          testusr    false    217   -.       �           0    0    companies_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.companies_id_seq', 8, true);
          public          testusr    false    214            �           0    0    referral_requests_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.referral_requests_id_seq', 1, false);
          public          testusr    false    220            �           0    0    sessions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);
          public          testusr    false    218            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 32, true);
          public          testusr    false    216                       2606    16411    companies companies_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_name_key;
       public            testusr    false    215                       2606    16409    companies companies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            testusr    false    215            &           2606    16455 (   referral_requests referral_requests_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.referral_requests
    ADD CONSTRAINT referral_requests_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.referral_requests DROP CONSTRAINT referral_requests_pkey;
       public            testusr    false    221            "           2606    16437    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            testusr    false    219            $           2606    16439     sessions sessions_session_id_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_session_id_key UNIQUE (session_id);
 J   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_session_id_key;
       public            testusr    false    219                       2606    16422    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            testusr    false    217                        2606    16420    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            testusr    false    217            )           2606    16461 3   referral_requests referral_requests_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.referral_requests
    ADD CONSTRAINT referral_requests_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);
 ]   ALTER TABLE ONLY public.referral_requests DROP CONSTRAINT referral_requests_company_id_fkey;
       public          testusr    false    221    3356    215            *           2606    16456 9   referral_requests referral_requests_referrer_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.referral_requests
    ADD CONSTRAINT referral_requests_referrer_user_id_fkey FOREIGN KEY (referrer_user_id) REFERENCES public.users(id);
 c   ALTER TABLE ONLY public.referral_requests DROP CONSTRAINT referral_requests_referrer_user_id_fkey;
       public          testusr    false    3360    221    217            (           2606    16440    sessions sessions_user_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_user_id_fkey;
       public          testusr    false    217    3360    219            '           2606    16423    users users_company_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_company_id_fkey FOREIGN KEY (company_id) REFERENCES public.companies(id);
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_company_id_fkey;
       public          testusr    false    3356    217    215            �   �   x�M�;�0 ��>EN���^h�T���%VkɲQ�V����7�-�foa܁�-��Aq���M#V�Q�2�!��&saӌhXqM��b)��њĤ/����bC��ȹp�x�:Q(���P�Q]7�� �5.�      �      x������ � �      �      x������ � �      �   �  x�mUKW�<]��8���7�<hCy����Ӎl+�Y
�����oF�+6d�s�F�s��N��F�T��ڍV<�9�!�.	�I�ݎ�Nۍt���AR'S��Y�[�d�Sg��c�]c�Һ�Y�;>�K��E���U�tAhK<?3�5�Rƙ���L�	<�U��t�0��F��U�� �/rUfm��FlAe�]<>��(�I��g5�)��ȋ6wF{�c0��G�˴)0�DT*ᑳ�w�����y4}:�T�:YIN�w�~�$#r���ӣ�պI��	��9�%�8�O�BEv��%'�t�v���h4^�|��;�"ݓ���&c����)dҸ�������*�_�����<��!����,]�įU�&�"|d�+Z��D��efsQ��]b�=�\�dN�mѺ�eV�\�R�2^*C�z�A�f��w�ڵ]�a�px[g#��)rM��Cp�Ȯ���(Ї\��p-e�{CUv-%�h2�E�h08!�2<��I�������2�A�>�U�p�p�u�}�6# �b2�$�`#�'���2�K��It���±��i��i� <��2��^�^���N {� |�;֌� ��a&5�^��{��������k��!%��[�~�/cO���&�tޢw �B�"�e����[�׌����_+<8�6�m��R���G.���cM�aDZ��N*��q��W��O��&� ?،����I͍��>$�H��7��!�B���i�ķpH���q��k�����#�{xH��7�����c3B(2�|�S�iƱ��T�Ld�R�E~�6�95��D���3�J��<���&�lJ�D�6�5
��I����>�2�7�6�4&w�)C��L[I��.�����0��6�8�с����pHt��9����p���f�F��⃧�     