# Premier exercice ruby - Utiliser les données d'une API OpenFoodFact

# ENONCé : Open Food Facts c'est quoi? Open Food Facts est une organisation 
# qui recense de façon colaborative des informations sur les produits 
# alimentaires disponibles dans le commerce. Identifiés par un code barre, 
# ces produits sont alors listés avec toutes les informations disponibles: 
# nom, marque, composition, lieu et pays de vente, etc... Open Food Fact 
# propose donc une API afin d'avoir accès à ces informations. Nous allons 
# donc apprendre à utiliser cette API avec un peu de code Ruby! Quelques 
# choses à savoir: Premièrement, il est important de noter que l'API utilise 
# le format Json, qui permet de récupérer les informations d'une base de données 
# sous forme d'objets. Il nous faudra donc un moyen de lire le Json avec Ruby. 
# Ces données Json son accessibles directement depuis le site Openfoodfacts.org. 
# Il nous faudra donc un moyen d'accéder à ces pages depuis notre fichier Ruby! 
# Mise en place La première étape va donc consister à créer notre fichier Ruby ! 
# Rien de plus simple, il suffit de créer un nouveau fichier avec une extension .rb

#OK

# Ensuite, il va falloir indiquer à notre programme quels sont les outils qu'il va 
# devoir précharger. En effet, bien que Ruby fournisse de nombreux outils de façon 
# native, certains d'entre eux nécessitent d'être "chargés". C'est justement le cas 
# des deux outils dont nous avont besoin.

require 'open_uri'
require 'json'

# OK

# La première ligne charge donc l'outil permettant de faire ce qu'on appelle des
# requêtes "GET". Une requête "GET" (à ne pas confondre avec gets) consiste à appeler 
# depuis votre programme une adresse url. Notre outil s'appelle donc Open-uri. Il ne 
# s'agit pas d'une Gem mais d'un module inclus de base dans Ruby. Nous allons donc 
# écrire une commande "require" suivie du nom du module entre guillemets. Ainsi nous 
# disons à notre programme "charge les fonctionalité du module pour que je puisse les 
# utiliser". Il nous faut ensuite faire de même avec le module Json, qui permet lui 
# d'interpréter du Json dans votre fichier Ruby! Voilà, nous pouvons commencer à coder!

# La base : Pour commencer, notre programme va devoir demander à l'utilisateur sur quel 
# produit il veut travailler. Nous allons donc écrire une commande gets, qui attendra 
# que l'utilisateur tape quelque chose avant de continuer la suite du programme. Afin
# que l'utilisateur sache quoi faire, nous accompagnons notre prompt d'une commande puts, 
# qui indiquera à l'utilisateur ce qui est attendu de lui. Nous terminons cette ligne 
# par .chomp, car la commande gets prend en compte le retour à la ligne. Chomp permet 
# de se débarasser de ce "faux" caractère en trop.

loop do
    puts 'Entrez un numéro de Code Barre :'
    bar_cod = gets.chomp

# OK

# Comme vous pouvez le constater, nous enregistrons l'entrée utilisateur dans une variable 
# que nous appelons "bar_code", afin de pouvoir la réutiliser plus tard. L'étape suivante 
# consiste à accéder aux bonnes informations depuis le site Open Food Facts. Le principe 
# est assez simple, il suffit d'entrer l'adresse suivant : 
# http://fr.openfoodfacts.org/api/v0/produit/un-code-barre.json
# En remplacant "un-code-barre" par le code barre du produit qu'on souhaite traiter. 
# Evidement, nous n'allons pas demander à l'utilisateur de l'écrire manuellement, nous 
# allons le faire pour lui, grâce à l'interpolation. L'interpolation pour rappel, permet 
# d'écrire du code au sein d'une chaîne de caractères. Créons donc une variable "url" 
# qui a pour valeur l'adresse donnée, en remplacant "un-code-barre" par l'entrée de notre 
# utilisateur. Je vous invite à entrer cette adresse avec un code barre dans votre 
# navigateur, afin de voir comment est construit le fichier Json fourni par l'API et de 
# comprendre quelles sont les informations disponibles et commant y accéder.

    url = 'http://fr.openfoodfacts.org/api/v0/produit/#{bar_code}.json'

# OK

# Le coeur / Bien, notre fichier Json est maintenant accessible depuis notre programme. 
# Sauf que c'est du Json, ce qui nous est peu utile puisque nous programmons en Ruby. 
# Heureusement, nous avons fait appel au module Json, qui va nous permettre de convertir 
# tout ça en objet Ruby! D'abord, demandons a notre programme d'ouvrir le fichier et de 
# le lire afin de l'enregistrer en mémoire. Et là encore, enregistrons le tout dans une 
# variable que nous appelerons "json".

    json = open(url).read

# OK

# Maintenant que notre programme a lu le fichier Json, nous pouvons lui demander de 
# faire une conversion de ce fichier vers un format que sera exploitable en ruby. 
# Nous utiliserons la commande JSON.parse(variable à convertir). en argument, nous mettrons
# tout simplement l'objet/variable à convertir. Là encore, nous enregistrons le tout dans 
# une variable que nous nommerons "data".

    data = JSON.parse(json)

# OK

# Et voilà, il ne nous reste plus qu'a exploiter les données ainsi récupérées. Puisque nos 
# données sont contenues dans un objet, on y accède en connaissant le nom de chaque propriété, 
# comme pour tout objet (d'ou l'intérêt d'explorer le fichier JSON fourni par l'API)

    puts data ['product']['product_name']

# OK

# Et voilà, notre programme renvoie bel et bien le nom du produit lorsque nous lançons 
# l'execution de notre fichier. Bon le problème c'est qu'il s'arrête tout de suite après. 
# Pas très pratique. Qu'à cela ne tienne, nous allons entourer notre code (mais pas les 
# require qui ne doivent s'exécuter qu'une fois!) avec une boucle des plus simple: 
# "loop do ... end"

end

# OK

# Et voilà, notre programme nous demandera indéfiniement de lui donner des code barres. 
# A vous de modifier à ligne "puts data...." pour que le programme renvoie les informations 
# qui vous intéressent. Pour finir, ci vous souhaitez en savoir plus sur openfactfood 
# http://fr.openfoodfacts.org/decouvrir
