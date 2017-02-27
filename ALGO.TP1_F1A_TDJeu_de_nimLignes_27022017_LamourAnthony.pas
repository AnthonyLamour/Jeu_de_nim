program jeu_de_nim_lignes;

uses crt;

{ALGO jeu de nim sur plusieurs lignes joueur contre joueur
//BUT créer un jeu de nim sur plusieurs lignes
//ENTREE nom des joueurs et nombre d'allumettes tirer ainsi que la lignes
//SORTIE nombre d'allumettes restante sur la ligne et victoire d'un des joueurs

fonction retire_allumettes(reste,ligne:ENTIER):ENTIER
//BUT retirer des allumettes d'une ligne
//ENTREE ligne et nombre d'allumettes restante sur cette ligne
//SORTIE nombre d'allumettes restante modifié
VAR
	allumettestirer:ENTIER 
DEBUT
	REPETER
		ECRIRE"Il reste "&reste&" allumettes sur la ligne "&ligne&" combien voulez vous en retirer ?"
		LIRE allumettestirer
	JUSQU'A (allumettestirer>0) ET (allumettestirer<=3) ET (allumettestirer<=reste) //vérification que le nombre est valide
	reste<-reste-allumettestirer
	retire_allumettes<-reste
FINFONCTION

fonction lignes(reste,ligne:ENTIER):ENTIER
//BUT vérifier si il reste des allumettes sur une ligne après le tirage
//ENTREE ligne et nombre d'allumettes restante sur cette ligne
//SORTIE ligne<-0 si elle est vide
DEBUT
	SI reste=0 ALORS
		ligne<-0
	FINSI
	lignes<-ligne
FINFONCTION

VAR
	tour,lj1,lj2,r1,r2,r3,r4:ENTIER //lj1 et lj2 sont les lignes où se situe les joueurs rn est le nombre d'allumettes restante sur la ligne n
	test:BOOLEEN //permet de réinitialiser la ligne de l'adversaire au cas ou le joueur prend la dernière allumettes de la ligne

DEBUT
	//initialisation
	lj1<-0
	lj2<-0
	tour<-0
	r1<-1
	r2<-3
	r3<-5
	r4<-7
	REPETER
		tour<-tour+1 //compteur de tour
		SI tour MOD 2<>0 ALORS //tour impaire joueur 1
			SI lj1=0 ALORS //si il n'est sur aucune ligne alors on lui demande sur quelle ligne il veux aller
				REPETER
					ECRIRE"Veuillez choisir votre ligne ?"
					LIRE lj1
					//vérification que la ligne est valide et non vide
					SI lj1<1 ou lj1>4 ALORS
						lj1<-0
					SINON
						SI lj1=1 ET r1=0 ALORS
							lj1<-0
						SINON
							SI lj1=2 ET r2=0 ALORS
								lj1<-0
							SINON
								SI lj1=3 ET r3=0 ALORS
									lj1<-0
								SINON
									SI lj1=4 ET r4=0 ALORS
										lj1<-0
									FINSI
								FINSI
							FINSI
						FINSI
					FINSI
				JUSQU'A lj1<>0
			FINSI
			test<-lj1=lj2
			//tirage des allumettes et si besoin réinitialisation de la ligne des joueurs
			CAS lj1 PARMIS
				1:r1<-retire_allumettes(r1,lj1)
				  lj1<-lignes(r1,lj1)
				2:r2<-retire_allumettes(r2,lj1)
				  lj1<-lignes(r2,lj1)
				3:r3<-retire_allumettes(r3,lj1)
				  lj1<-lignes(r3,lj1)
				4:r4<-retire_allumettes(r4,lj1)
				  lj1<-lignes(r4,lj1)
			FINCASPARMIS
			SI test=vraie et lj1=0 ALORS
				lj2<-0
			FINSI
		SINON // tour paire joueur 2
			SI lj2=0 ALORS //si il n'est sur aucune ligne alors on lui demande sur quelle ligne il veux aller
				REPETER
					ECRIRE"Veuillez choisir votre ligne ?"
					LIRE lj2
					//vérification que la ligne est valide et non vide
					SI lj2<1 ou lj2>4 ALORS
						lj2<-0
					SINON
						SI lj2=1 ET r1=0 ALORS
							lj2<-0
						SINON
							SI lj2=2 ET r2=0 ALORS
								lj2<-0
							SINON
								SI lj2=3 ET r3=0 ALORS
									lj2<-0
								SINON
									SI lj2=4 ET r4=0 ALORS
										lj2<-0
									FINSI
								FINSI
							FINSI
						FINSI
					FINSI
				JUSQU'A lj2<>0
			FINSI
			test<-lj1=lj2
			//tirage des allumettes et si besoin réinitialisation de la ligne des joueurs
			CAS lj2 PARMIS
				1:r1<-retire_allumettes(r1,lj2)
				  lj2<-lignes(r1,lj2)
				2:r2<-retire_allumettes(r2,lj2)
				  lj2<-lignes(r2,lj2)
				3:r3<-retire_allumettes(r3,lj2)
				  lj2<-lignes(r3,lj2)
				4:r4<-retire_allumettes(r4,lj2)
				  lj2<-lignes(r4,lj2)
			FINCASPARMIS
			SI test=vraie et lj2=0 ALORS
				lj1<-0
			FINSI		
	JUSQU'A r1=0 ET r2=0 ET r3=0 ET r4=0
	//affichage du joueur gagnant
	SI tour MOD 2=0 ALORS
		ECRIRE "Victoire du joueur 1"
	SINON
		ECRIRE "Victoire du joueur 2"
	FINSI
FIN}

function retire_allumettes(reste,ligne:integer):integer;
//BUT retirer des allumettes d'une ligne
//ENTREE ligne et nombre d'allumettes restante sur cette ligne
//SORTIE nombre d'allumettes restante modifié
VAR
	allumettestirer:integer;
BEGIN
	REPEAT
		writeln('Il reste ',reste,' allumettes sur la ligne ',ligne,' combien voulez vous en retirer ?');
		readln(allumettestirer);
	UNTIL (allumettestirer>0) AND (allumettestirer<=3) AND (allumettestirer<=reste); //vérification que le nombre est valide
	reste:=reste-allumettestirer;
	retire_allumettes:=reste;
END;

function lignes(reste,ligne:integer):integer;
//BUT vérifier si il reste des allumettes sur une ligne après le tirage
//ENTREE ligne et nombre d'allumettes restante sur cette ligne
//SORTIE ligne:=0 si elle est vide
BEGIN
	IF reste=0 THEN
		begin
			ligne:=0;
		end;
	lignes:=ligne;
END;

VAR
	tour,lj1,lj2,r1,r2,r3,r4:integer; //lj1 et lj2 sont les lignes où se situe les joueurs rn est le nombre d'allumettes restante sur la ligne n
	test:boolean; //permet de réinitialiser la ligne de l'adversaire au cas ou le joueur prend la dernière allumettes de la ligne

BEGIN
	clrscr;
	//initialisation
	lj1:=0;
	lj2:=0;
	tour:=0;
	r1:=1;
	r2:=3;
	r3:=5;
	r4:=7;
	REPEAT
		tour:=tour+1; //compteur de tour
		IF tour MOD 2<>0 THEN //tour impaire joueur 1
			begin
				writeln('Tour Joueur 1:');
				IF lj1=0 THEN //si il n'est sur aucune ligne alors on lui demande sur quelle ligne il veux aller
					begin
						REPEAT
							writeln('Veuillez choisir votre ligne ?');
							readln(lj1);
							//vérification que la ligne est valide et non vide
							IF (lj1<1) OR (lj1>4) THEN
								begin
									lj1:=0;
								end
							ELSE
								begin
									IF (lj1=1) AND (r1=0) THEN
										begin
											lj1:=0;
										end
									ELSE
										begin
											IF (lj1=2) AND (r2=0) THEN
												begin
													lj1:=0;
												end
											ELSE
												begin
													IF (lj1=3) AND (r3=0) THEN
														begin
															lj1:=0;
														end
													ELSE
														begin
															IF (lj1=4) AND (r4=0) THEN
																begin
																	lj1:=0;
																end;
														end;
												end;
										end;
								end;
						UNTIL lj1<>0;
					end;
				test:=lj1=lj2;
				//tirage des allumettes et si besoin réinitialisation de la ligne des joueurs
				CASE lj1 OF
					1:begin
						r1:=retire_allumettes(r1,lj1);
						lj1:=lignes(r1,lj1);
					  end;
					2:begin
						r2:=retire_allumettes(r2,lj1);
						lj1:=lignes(r2,lj1);
					  end;
					3:begin
						r3:=retire_allumettes(r3,lj1);
						lj1:=lignes(r3,lj1);
					  end;
					4:begin
						r4:=retire_allumettes(r4,lj1);
						lj1:=lignes(r4,lj1);
					  end;
				end;
				IF (test=TRUE) AND (lj1=0) THEN
					begin
						lj2:=0;
					end;
			end
		ELSE // tour paire joueur 2
			begin
				writeln('Tour Joueur 2');
				IF lj2=0 THEN //si il n'est sur aucune ligne alors on lui demande sur quelle ligne il veux aller
					begin
						REPEAT
							writeln('Veuillez choisir votre ligne ?');
							readln(lj2);
							//vérification que la ligne est valide et non vide
							IF (lj2<1) OR (lj2>4) THEN
								begin
									lj2:=0;
								end
							ELSE
								begin
									IF (lj2=1) AND (r1=0) THEN
										begin
											lj2:=0;
										end
									ELSE
										begin
											IF (lj2=2) AND (r2=0) THEN
												begin
													lj2:=0;
												end
											ELSE
												begin
													IF (lj2=3) AND (r3=0) THEN
														begin
															lj2:=0;
														end
													ELSE
														begin
															IF (lj2=4) AND (r4=0) THEN
																begin
																	lj2:=0;
																end;
														end;
												end;
										end;
								end;
						UNTIL lj2<>0;
					end;
				test:=lj1=lj2;
				//tirage des allumettes et si besoin réinitialisation de la ligne des joueurs
				CASE lj2 OF
					1:begin
						r1:=retire_allumettes(r1,lj2);
						lj2:=lignes(r1,lj2);
					  end;
					2:begin
						r2:=retire_allumettes(r2,lj2);
						lj2:=lignes(r2,lj2);
					  end;
					3:begin
						r3:=retire_allumettes(r3,lj2);
						lj2:=lignes(r3,lj2);
					  end;
					4:begin
						r4:=retire_allumettes(r4,lj2);
						lj2:=lignes(r4,lj2);
					  end;
				end;
				IF (test=TRUE) AND (lj2=0) THEN
					begin
						lj1:=0;
					end;
			end;
		readln;
	UNTIL (r1=0) AND (r2=0) AND (r3=0) AND (r4=0);
	//affichage du joueur gagnant
	IF tour MOD 2=0 THEN
		begin
			writeln('Victoire du joueur 1');
		end
	ELSE
		begin
			writeln('Victoire du joueur 2');
		end;
	readln;
END.