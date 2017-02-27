program jeu_de_nim;

uses crt;

{ALGO jeu de nim contre un joueur
//BUT créer un jeu de nim
//ENTREE noms des joueurs et nombre d'allumettes retirées
//SORTIE victoire d'un des joueurs et nombre d'allumettes restantes

procedure initialisation_de_partie(var nomJ1,var nomJ2:CHAINE,var nballumettes:ENTIER)
//BUT initialiser le nom de chauque joueur ainsi que le premier joueur qui vas jouer et le nombre d'allumettes de base
//ENTREE nomJ1 nomJ2
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
	//demande du nom du deuxième joueur
	REPETER  //boucle de vérification
		ECRIRE "Veuillez entrer le nom du deuxième joueur :"
		LIRE nomJ2
	JUSQU'A nomJ2<>''
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

procedure tour(var nballumettes:ENTIER)
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
	nomJ1,nomJ2:CHAINE //sont le nom des joueurs
	nballumettes,tour:ENTIER // nballumettes est le nombre d'allumettes restantes

DEBUT

	//initialise le nom des joueurs décide qui joue en premier ansi que le nombre d'allumettes de base
	initialisation_de_partie(nomJ1,nomJ2,nballumettes)
	//initialisation du nombre de tour
	tour<-1
	//boucle de manche
	REPETER
		SI tour MOD 2 <>0 ALORS
			ECRIRE"Tour de "&nomJ1&"." //tour de joueur 1
			//simulation du tirage des allumettes
			tour(nballumettes)
			//affichage du nombre d'allumettes restantes
			affichage(nballumettes)
		SINON
			ECRIRE"Tour de "&nomJ2&"." //tour de joueur 2
			//simulation du tirage des allumettes
			tour(nballumettes)
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

FIN}

procedure initialisation_de_partie(var nomJ1:string;var nomJ2:string;var nballumettes:integer);
//BUT initialiser le nom de chauque joueur ainsi que le premier joueur qui vas jouer et le nombre d'allumettes de base
//ENTREE nomJ1 nomJ2
//SORTIE nombre d'allumettes et joueur commençant la partie
VAR
	res:integer; //sert pour le random
	nomstock:string; //sert à inverser le nom des joueur si besoin
BEGIN
	//demande du nom du premier joueur
	REPEAT //boucle de vérification
		writeln('Veuillez entrer le nom du premier joueur :');
		readln(nomJ1);
	UNTIL nomJ1<>'';
	//demande du nom du deuxième joueur
	REPEAT //boucle de vérification
		writeln(UTF8ToAnsi('Veuillez entrer le nom du deuxième joueur :'));
		readln(nomJ2);
	UNTIL nomJ2<>'';

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
	nballumettes:=21
END;

procedure tour(var nballumettes:integer);
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
	nomJ1,nomJ2:string; //sont le nom des joueurs
	nballumettes,tours:integer; //nballumettes est le nombre d'allumettes restantes et tours est un compteur de tour
BEGIN

	clrscr;
	//initialise le nom des joueurs décide qui joue en premier ansi que le nombre d'allumettes de base
	initialisation_de_partie(nomJ1,nomJ2,nballumettes);

	//initialisation du nombre de tour
	tours:=1;

	//boucle de manche
	REPEAT
		IF (tours MOD 2 <>0) THEN //tour de joueur 1
			begin
				writeln('Tour de ',nomJ1,'.');
				//simulation du tirage des allumettes
				tour(nballumettes);
				//affichage du nombre d'allumettes restantes
				affichage(nballumettes);
			end
		ELSE
			begin	//tour de joueur 2
				writeln('Tour de ',nomJ2,'.');
				//simulation du tirage des allumettes
				tour(nballumettes);
				//affichage du nombre d'allumettes restantes
				affichage(nballumettes);
			end;
		tours:=tours+1;
	UNTIL (nballumettes=0);

	//affichage des scores
	IF (tours MOD 2 <>0) THEN
		begin
			writeln(nomJ1,UTF8ToAnsi(' a gagné !'));
		end
	ELSE
		begin
			writeln(nomJ2,UTF8ToAnsi(' a gagné !'));
		end;
	readln;

END.