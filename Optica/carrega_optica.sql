Delete from client;
delete from ulleres;
delete from marca;
delete from empleat;
Delete from proveidor;

INSERT INTO `optica`.`proveidor` (`idproveidor`,`nom`,`carrer`,`numero`,`pis`,`porta`,`ciutat`,`codi_postal`,`pais`,`telefon`,`fax`,`NIF`)
VALUES (1,'International Glasses Inc','Chester',35,2,'B','Londres','04534','England','662016317','662016318','P84580578');

INSERT INTO `optica`.`proveidor` (`idproveidor`,`nom`,`carrer`,`numero`,`pis`,`porta`,`ciutat`,`codi_postal`,`pais`,`telefon`,`fax`,`NIF`)
VALUES (2,'Ulleres Garcia','Diagonal',645,6,'A','Barcelona','08036','Espanya','932016317','932016318','B64580574');

INSERT INTO `optica`.`marca` (`idmarca`, `idproveidor`, `nom`) VALUES ('1', '1', 'Beta');
INSERT INTO `optica`.`marca` (`idmarca`, `idproveidor`, `nom`) VALUES ('2', '1', 'Omega');
INSERT INTO `optica`.`marca` (`idmarca`, `idproveidor`, `nom`) VALUES ('3', '2', 'Rayban');

INSERT INTO `optica`.`empleat` (`idempleat`, `nom`) VALUES ('1', 'Josep');
INSERT INTO `optica`.`empleat` (`idempleat`, `nom`) VALUES ('2', 'Maria');
INSERT INTO `optica`.`empleat` (`idempleat`, `nom`) VALUES ('3', 'Cristina');

INSERT INTO `optica`.`ulleres` (`idmarca`,`graduacio_dreta`,`graduacio_esquerra`,`tipus_muntura`,`color_muntura`,`color_vidre_dret`,`color_vidre_esquerra`,`preu`, `idempleat`)
VALUES (1,120,130,'pasta','blau','blanc','blau',159.50, 1);

INSERT INTO `optica`.`ulleres` (`idmarca`,`graduacio_dreta`,`graduacio_esquerra`,`tipus_muntura`,`color_muntura`,`color_vidre_dret`,`color_vidre_esquerra`,`preu`,`idempleat`)
VALUES (2,125,109,'metalic','metalic','groc','verd',179.60,2);

INSERT INTO `optica`.`client` (`idclient`,`nom`,`carrer`,`numero`,`pis`,`porta`,`ciutat`,`codi_postal`,`client_id`,`idmarca`,`data_registre`)
VALUES (1,'Josep Fernandez','Via Augusta',242,1,NULL,'Barcelona','08022',NULL,1,'2018-03-01');

INSERT INTO `optica`.`client` (`idclient`,`nom`,`carrer`,`numero`,`pis`,`porta`,`ciutat`,`codi_postal`,`client_id`,`idmarca`,`data_registre`)
VALUES (2,'Pere Garcia','Mandri',2,'Entressol',1,'Barcelona','08021',1,2,'2019-04-11');
