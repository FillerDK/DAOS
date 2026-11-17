USE cykling

DROP TABLE IF EXISTS placering
DROP TABLE IF EXISTS vm
DROP TABLE IF EXISTS rytter

GO

CREATE TABLE rytter
(
    init char(3) not null,  -- initialer, der entydigt identificerer rytterne
    rytternavn varchar(30), -- rytterens navn
    primary key (init),
)

CREATE TABLE vm
(
    aarstal int not null,   -- det år, VM blev afholdt
    bynavn varchar(20),     -- den by, VM blev afholdt i
    land varchar(20),       -- det land VM blev afholdt i
    primary key (aarstal),
)

CREATE TABLE placering
(
    aarstal int,            -- det år rytteren opnåede placeringen
    init char(3),           -- initialer på den rytter, der opnåede placeringen
    plac int,               -- den placering rytteren opnåede -
                            -- NULL betyder at rytteren deltog, men udgik
    primary key (aarstal, init),
    constraint initforeign foreign key (init) references rytter(init),
    constraint aarstalforeign foreign key (aarstal) references vm(aarstal),
)