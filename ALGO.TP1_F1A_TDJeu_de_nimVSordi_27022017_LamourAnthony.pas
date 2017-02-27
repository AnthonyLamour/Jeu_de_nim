program jeu_de_nim_vs_ordi;

uses crt;

{ALGO jeu de nim contre l'ordinateur
BUT créer un jeu de nim qui se joue seul contre l'ordinateur
ENTREE nom du joueur nombre d'allumettes retiré à chaque tour
SORTIE nombre d'allumettes restantes et victoire ou défaite du joueur

procedure init (var nomJ1,var nomJ2:CHAINE,nballumettes:ENTIER)
//BUT initialiser le nom du joueur ainsi que le premier joueur qui vas jouer et le nombre d'allumettes de base
//ENTREE nom du joueur
//SORTIE nombre d'allumettes et joueur commençant la partie
VAR
	res:ENTIER //sert pour le random
	nomstock:CHAINE //sert à inverser le nom des joueur si besoin
DEBUT
	//demande du nom du premier joueur
	REPETER //boucle de vérification
		ECRIRE "Veuillez entrer le nom du premier joueur :"
		LIRE nomJ1
	JUSQU'A nomJ1<>''
	//le deuxième joueur aura le ,om ordi
	nomJ2<-'ordi'
	//tirage au sort du premier joueur
	res<-random(1,2)
	//remise des noms dans l'ordre si besoin
	SI rers=2 ALORS
		nom<-nomJ1
		nomJ1<-nomJ2
		nomJ2<-nom
	FINSI
	//initialisation du nombre d'allumettes
	nballumettes<-21
FINPROCEDURE

procdure tour_ordi (var nballumettes:ENTIER)
//BUT simuler le tirage d'allumettes
//ENTREE nballumettes
//SORTIE nballumettes modifié
VAR
	allumettestirer,i,allumettestock,test:ENTIER
DEBUT
	//initialisation de allumettestirer
	allumettestirer<-0	//allumettestirer sera le nombre d'allumettes tiré par l'ordinateur
	SI nballumettes>4	//si il y a au moins 5 allumettes restantes
		POUR i DE 1 A 3 FAIRE
			allumettestock<-i	//allumettestock va permettre de voir si il faut prendre i allumettes
			test<-nballumettes-allumettestock	//test va vérifier que si on retire i allumettes il reste un multiple de 4 +1 ou non
			SI test-1 MOD 4=0 ALORS //si c'est le cas alors l'ordinateur va retirer i allumettes
				allumettestirer<-allumettestock
			FINSI
		FINPOUR
		SI allumettestirer=0 ALORS	//si il ne peut pas alors il en retire une
			allumettestirer<-1
		FINSI
	SINON
		POUR i DE 1 A 3 FAIRE //si il y a 4 allumettes ou moins alors il en laisse une
			allumettestock<-i
			test<-nballumettes-allumettestock
			SI test=1 ALORS
				allumettestirer<-allumettestock
			FINSI
		FINPOUR
	FINSI
	nballumettes<-nballumettes-allumettestirer
FINPROCEDURE

procedure tour_joueur(var nballumettes:ENTIER)
//BUT simuler le tirage d'allumettes
//ENTREE nombre d'allumettes tiré par le joueur et nballumettes
//SORTIE nballumettes modifié
VAR
	allumettestirer:ENTIER //nombre d'allumettes tiré par le joueur
DEBUT
	SI nballumettes<3 ALORS //si le nombre d'allumettes restantes est inférieur à 3
		REPETER
			ECRIRE"Combien d'allumettes voulez vous tirer ?" //demande du nombre d'allumettes à retirer
			LIRE allumettestirer
		JUSQU'A (allumettestirer>0) ET (allumettestirer<=nballumettes) //boucle de vérification
	SINON
		REPETER //si il reste plus de 3 allumettes
			ECRIRE"Combien d'allumettes voulez vous tirer ?" //demande du nombre d'allumettes à retirer
			allumettestirer
		JUSQU'A (allumettestirer>0) ET (allumettestirer<4) //boucle de vérification
	FINSI
	//modification du nombre d'allumettes restantes
	nballumettes<-nballumettes-allumettestirer
FINPROCEDURE

procedure affichage(nballumettes:ENTIER)
//BUT afficher le nombre d'allumettes restantes
//ENTREE aucune
//SORTIE nombre d'allumettes restantes
VAR
	i:ENTIER //sert à dessiner les allumettes restantes
	ch:CHAINE //sert à dessiner les allumettes restantes
DEBUT
	ch<-''
	//affichage du nombre d'allumettes restantes
	ECRIRE"Il reste "&nballumettes
	//dessin des allumettes restantes
	POUR i DE 1 A nballumettes FAIRE
		ch<-ch+' I '
	FINPOUR
	ECRIRE ch
FINPROCEDURE

VAR
	nomJ1,nomJ2: CHAINE //sont le nom des joueurs l'un des deux sera ordi
	nballumettes,tour:ENTIER //nballumettes est le nombre d'allumettes restantes

DEBUT

	//initialise le nom des joueurs décide qui joue en premier ansi que le nombre d'allumettes de base
	init(nomJ1,nomJ2,nballumettes)
	//initialisation du nombre de tour
	tour<-1
	REPETER
		SI tour MOD 2 <>0 ALORS
			ECRIRE "Tour de "&nomJ1&"." //tour de joueur 1
			SI monJ1='ordi' ALORS
				//simulation du tirage des allumettes
				tour_ordi(nballumettes)
			SINON
				//simulation du tirage des allumettes
				tour_joueur(nballumettes)
			FINSI
			//affichage du nombre d'allumettes restantes
			affichage(nballumettes)
		SINON
			ECRIRE "Tour de "&nomJ2&"." //tour de joueur 1
			SI monJ2='ordi' ALORS
				//simulation du tirage des allumettes
				tour_ordi(nballumettes)
			SINON
				//simulation du tirage des allumettes
				tour_joueur(nballumettes)
			FINSI
			//affichage du nombre d'allumettes restantes
			affichage(nballumettes)
		FINSI
		tour<-tour+1
	JUSQU'A nballumettes=0
	//affichage des scores
	SI tour MOD 2 <>0 ALORS
		ECRIRE nomJ1&" a gagné !"
	SINON
		ECRIRE nomJ2&" a gagné !"
	FINSI
FIN
}

procedure init (var nomJ1:string;var nomJ2:string;var nballumettes:integer);
//BUT initialiser le nom du joueur ainsi que le premier joueur qui vas jouer et le nombre d'allumettes de base
//ENTREE nom du joueur
//SORTIE nombre d'allumettes et joueur commençant la partie
VAR
	res:integer; //sert pour le random
	nomstock:string; //sert à inverser le nom des joueur si besoin
BEGIN
	//demande du nom du premier joueur
	REPEAT //boucle de vérification
		writeln('Veuillez entrer le nom du premier joueur :');
		readln(nomJ1);
	UNTIL (nomJ1<>'');
	//le deuxième joueur aura le ,om ordi
	nomJ2:='ordi';
	//tirage au sort du premier joueur
	randomize;
	res:=random(3);
	//remise des noms dans l'ordre si besoin
	IF res=2 THEN
		begin
			nomstock:=nomJ1;
			nomJ1:=nomJ2;
			nomJ2:=nomstock;
		end;
	//initialisation du nombre d'allumettes
	nballumettes:=21;
END;

procedure tour_ordi (var nballumettes:integer);
//BUT simuler le tirage d'allumettes
//ENTREE nballumettes
//SORTIE nballumettes modifié
VAR
	allumettestirer,i,allumettestock,test:integer;
BEGIN
	//initialisation de allumettestirer
	allumettestirer:=0;	//allumettestirer sera le nombre d'allumettes tiré par l'ordinateur
	IF nballumettes>4 THEN	//si il y a au moins 5 allumettes restantes
		begin
			FOR i:=1 TO 3 DO
				begin
					allumettestock:=i;	//allumettestock va permettre de voir si il faut prendre i allumettes
					test:=nballumettes-allumettestock;	//test va vérifier que si on retire i allumettes il reste un multiple de 4 +1 ou non
					IF (test-1) MOD 4=0 THEN //si c'est le cas alors l'ordinateur va retirer i allumettes
						begin
							allumettestirer:=allumettestock;
						end;
				end;
		end
	ELSE
		begin
			FOR i:=1 TO 3 DO //si il y a 4 allumettes ou moins alors il en laisse une
				begin
					allumettestock:=i;
					test:=nballumettes-allumettestock;
					IF test=1 THEN
						begin
							allumettestirer:=allumettestock;
						end;
				end;
		end;
	IF allumettestirer=0 THEN	//si il ne peut pas alors il en retire une
	begin
		allumettestirer:=1;
	end;
	nballumettes:=nballumettes-allumettestirer;
END;

procedure tour_joueur(var nballumettes:integer);
//BUT simuler le tirage d'allumettes
//ENTREE nombre d'allumettes tiré par le joueur et nballumettes
//SORTIE nballumettes modifié
VAR
	allumettestirer:integer; //nombre d'allumettes tiré par le joueur
BEGIN
	IF nballumettes<3 THEN //si le nombre d'allumettes restantes est inférieur à 3
		begin
			REPEAT //boucle de vérification
				writeln('Combien d''allumettes voulez vous tirer ?'); //demande du nombre d'allumettes à retirer
				readln(allumettestirer);
			UNTIL (allumettestirer>0) AND (allumettestirer<=nballumettes);
		end
	ELSE
		begin //si il reste plus de 3 allumettes
			REPEAT
				writeln('Combien d''allumettes voulez vous tirer ?'); //demande du nombre d'allumettes à retirer
				readln(allumettestirer);
			UNTIL(allumettestirer>0) AND (allumettestirer<4); //boucle de vérification
		end;

	//modification du nombre d'allumettes restantes
	nballumettes:=nballumettes-allumettestirer;
END;

procedure affichage(nballumettes:integer);
//BUT afficher le nombre d'allumettes restantes
//ENTREE aucune
//SORTIE nombre d'allumettes restantes
VAR
	i:integer; //sert à dessiner les allumettes restantes
BEGIN
	//affichage du nombre d'allumettes restantes
	writeln('Il reste ',nballumettes);
	//dessin des allumettes restantes
	FOR i:=1 TO nballumettes DO
		begin
			write(' I ');
		end;
	writeln();
END;

VAR
	nomJ1,nomJ2: string; //sont le nom des joueurs l'un des deux sera ordi
	nballumettes,tour:integer; //nballumettes est le nombre d'allumettes restantes

BEGIN

	clrscr;
	//initialise le nom des joueurs décide qui joue en premier ansi que le nombre d'allumettes de base
	init(nomJ1,nomJ2,nballumettes);
	//initialisation du nombre de tour
	tour:=1;
	REPEAT
		clrscr;
		IF tour MOD 2 <>0 THEN
			begin
				writeln('Tour de ',nomJ1,'.'); //tour de joueur 1
				IF nomJ1='ordi' THEN
					begin
						//simulation du tirage des allumettes
						tour_ordi(nballumettes);
					end
				ELSE
					begin
						//simulation du tirage des allumettes
						tour_joueur(nballumettes);
					end;
				//affichage du nombre d'allumettes restantes
				affichage(nballumettes);
			end
		ELSE
			begin
				writeln('Tour de ',nomJ2,'.'); //tour de joueur 1
				IF nomJ2='ordi' THEN
					begin
						//simulation du tirage des allumettes
						tour_ordi(nballumettes);
					end
				ELSE
					begin
						//simulation du tirage des allumettes
						tour_joueur(nballumettes);
					end;
				//affichage du nombre d'allumettes restantes
				affichage(nballumettes);
			end;
		tour:=tour+1;
		readln;
	UNTIL nballumettes=0;
	//affichage des scores
	IF tour MOD 2 <>0 THEN
		begin
			writeln(nomJ1,UTF8ToAnsi(' a gagné !'));
		end
	ELSE
		begin
			writeln(nomJ2,UTF8ToAnsi(' a gagné !'));
		end;
	readln;
END.
