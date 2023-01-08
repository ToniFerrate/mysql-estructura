Delete from client;
delete from ulleres;
Delete from proveidor;

INSERT INTO `optica`.`proveidor` (`idproveidor`,`nom`,`carrer`,`numero`,`pis`,`porta`,`ciutat`,`codi_postal`,`pais`,`telefon`,`fax`,`NIF`)
VALUES (1,'International Glasses Inc','Chester',35,2,'B','Londres','04534','England','662016317','662016318','P84580578');

INSERT INTO `optica`.`proveidor` (`idproveidor`,`nom`,`carrer`,`numero`,`pis`,`porta`,`ciutat`,`codi_postal`,`pais`,`telefon`,`fax`,`NIF`)
VALUES (2,'Ulleres Garcia','Diagonal',645,6,'A','Barcelona','08036','Espanya','932016317','932016318','B64580574');

INSERT INTO `optica`.`ulleres` (`idproveidor`,`marca`,`graduacio_dreta`,`graduacio_esquerra`,`tipus_muntura`,`color_muntura`,`color_vidre_dret`,`color_vidre_esquerra`,`preu`)
VALUES (1,'Omega',120,130,'pasta','blau','blanc','blau',159.50);

INSERT INTO `optica`.`ulleres` (`idproveidor`,`marca`,`graduacio_dreta`,`graduacio_esquerra`,`tipus_muntura`,`color_muntura`,`color_vidre_dret`,`color_vidre_esquerra`,`preu`)
VALUES (1,'Beta',125,109,'metalic','metalic','groc','verd',179.60);

INSERT INTO `optica`.`client` (`idclient`,`nom`,`carrer`,`numero`,`pis`,`porta`,`ciutat`,`codi_postal`,`client_id`,`empleat`,`idproveidor`,`marca`,`data_registre`)
VALUES (1,'Josep Fernandez','Via Augusta',242,1,NULL,'Barcelona','08022',NULL,'Maria',1,'Omega','2018-03-01');

INSERT INTO `optica`.`client` (`idclient`,`nom`,`carrer`,`numero`,`pis`,`porta`,`ciutat`,`codi_postal`,`client_id`,`empleat`,`idproveidor`,`marca`,`data_registre`)
VALUES (2,'Pere Garcia','Mandri',2,'Entressol',1,'Barcelona','08021',1,'Jordi',1,'Beta','2019-04-11');
