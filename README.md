# Sismondi NFT demo

Ce répertoire contient la démo pour la semaine des étudiants du gymnase Sismondi.
Pendant cette semaine, les étudiants vont passer une journée à l'EPFL pour apprendre
plus sur les blockchains et les NFTs.
Le programme de la journée est le suivant:

Matin:
- présentation de Mme Zürcher
- présentation de Linus Gasser sur les blockchains
- exercices pour se familiariser avec les outils nécessaires pour la suite

Après-midi:
- présentation de Linus Gasser sur les NFTs
- exercices sur les NFTs en utilisant ce répertoire

## Les transparents

Vous trouvez les transparents de la journée NFT ici: 
https://docs.google.com/presentation/d/1x2FqWLHjh-F-auDqM0_eJ4Nv5r-jLTy-K3gfAH9umH8/edit?usp=sharing

Pour poser des questions, vous pouvez utiliser le lien suivant: 
https://slides.app.goo.gl/v8EMX

Pour échanger des clés publiques dans les exercices suivants, vous pouvez utiliser Chatzy avec le
mot de passe écrit au tableau:

https://www.chatzy.com/78734252296038

# 1.1 - Création d'un portefeuille (wallet)

## 1.1.1 - Téléchargement du répertoire

Pour commencer, il faut télécharger le répertoire github sur votre ordinateur.
Suivez ces étapes:
- connectez-vous sur le compte que vous avez reçu
- cliquez sur "IC-Gymnases"
- cliquez la grille en bas à gauche, sélectionnez  "Firefox", et allez sur la page
https://go.epfl.ch/sismondi
- cliquez la grille en bas à gauche, sélectionnez "terminal"
- copiez la commande suivante dans votre terminal - attention, tous les caractères doivent
être copiés/collés tel quel! Vous pouvez faire un copier/coller depuis Firefox:

```bash
git clone https://github.com/c4dt/sismondi_nft_2024
```

## 1.1.2 - Ouverture de Thonny

Pour ouvrir le logiciel Thonny, suivez ces étapes:
- cliquez sur la grille en bas à gauche, CHERCHEZ "Thonny"
- vous pouvez déjà ouvrir le fichier `NOTES.md` qui se trouve dans le répertoire
`sismondi_nft_2024`
Il faut choisir `all files` en bas à droite du dialogue de fichiers pour voir les fichiers
qui se terminent en `.md`.

## Le porte-feuille - "the wallet"

Pour finaliser l'expérience avec les NFTs, vous avez besoin d'un portefeuille.
Ce portefeuille s'appelle "Wallet" en Anglais et contient vos clés privées pour
la blockchain.
Ces clés privées sont comme un mot de passe, mais beaucoup plus long, et avec des
propriétés mathématiques intéressantes pour les blockchains.
Si quelqu'un réussi à copier vos clés privées, cette personne a le même accès que vous
à votre portefeuille.
Donc ne donnez votre clé privée à personne!
Le portefeuille Metamask demande un mot de passe qui protègera vos clés privées.
Pour sécuriser, il est conseillé d'écrire le "recovery phrase" quelque part.

On utilisera ici le portefeuille le plus connu: Metamask.

### ATTENTION! SCAMS! VOLS!

Il faut être très prudent dans le monde des blockchains sur les scams (tricheries)
et vols.
Vu que la clé privée est la seule chose qui protège vos jetons, du moment que quelqu'un
la possède, cette personne peut faire ce qu'elle veut avec vos jetons.
Donc, il est impératif de:
- ne jamais partager sa clé privée
- ne pas installer des logiciels d'une source douteuse

### 1.1.3 - Installation Metamask

Aller sur le site de Metamask et suivre les instructions d'installation:

[Installer Metamask](https://metamask.io/download/)

Deux choses importantes:
- écrivez votre mot de passe dans le fichier `NOTES.md` (voir 1.1.2 comment l'ouvrir)
- sécuriser l'installation
- copier TOUS LES 12 mots de récupération dans le fichier `NOTES.md`
- pour confirmer, remplir les espaces vides - ceci est pour vérifier que vous avez bien
noté votre phrase de récupération
- après, il faut encore choisir le réseau "Sepolia": cliquer en haut à gauche dans 
 `Ethereum Mainnet`, puis cochez `Show test networks`, ensuite choisir "Sepolia".

## 1.1.4 - Enregistrer vos clés dans le fichier NOTES.md

Pour vous faciliter la vie, on va copier la clé publique et la clé privée dans le
fichier `NOTES.md`:
- recopiez votre adresse PUBLIQUE dans le fichier `NOTES.md`
- `PRIVATE_KEY` se trouve dans la "wallet" Metamask:
  - cliquer sur les trois petits points à droite du nom de votre compte
  - choisissez "Account details", puis "Show private key"
  - confirmez avec votre mot de passe
  - appuyez longuement sur le bouton
  - copiez/collez la clé privée depuis la fenêtre dans le fichier `.env`

# 1.2 - Charger votre portefeuille avec quelques jetons

Pour la prochaine étape, vous avez besoin de quelques jetons.
Les réseaux blockchains de test vous permettent de recevoir des jetons gratuits.
Bien sûr que vous ne pouvez pas revendre ces jetons, ils ne valent rien.

## 1.2.1 - Utiliser un "robinet" pour les jetons

Afin de recevoir quelques jetons, vous pouvez copier votre adresse depuis Metamask
dans le robinet suivant:

[Faucet](https://sepolia-faucet.pk910.de)

L'adresse PUBLIQUE commence avec un `0x` et contient des chiffres et des lettres a-f.

Une fois le robinet ouvert, vous attendez quelques minutes pour avoir 0.5 SepETH.
C'est suffisant pour le moment.
Quand le montant est atteint, cliquez sur "Stop Mining", puis "Claim Rewards" et attendez que vos jetons
se trouvent sur votre compte.

## 1.2.2 - Vérification de la réception des jetons

Maintenant, on va utiliser `Etherscan` pour voir ce qui s'est passé.
Entrez votre adresse publique sur le site suivant, afin de
suivre les transactions sur votre compte et depuis votre compte:

[Etherscan](https://sepolia.etherscan.io)

Si vous ne voyez pas votre transaction, assurez-vous que vous êtes bien sur le réseau 
"Sepolia".

## 1.2.3 - Transfert de jetons

Pour finir notre matinée, vous allez transférer quelques jetons à vos voisins.
Ne mettez pas trop de jetons, quelque chose comme 0.001 est très bien.

- Demandez à vos voisins leur adresse privée de leur portefeuille
  - Assurez-vous qu'ils ne vous la donnent pas! Sinon, vous pouvez créer un
  nouveau portefeuille et transférer tous leurs jetons chez vous!
- Demandez à vos voisins leur adresse publique de leur portefeuille.
Vous pouvez utiliser [Chatzy](https://www.chatzy.com/78734252296038)
- Ouvrez "Metamask" dans Firefox
- Cliquez sur "Send"
- Entrez l'adresse que vous avez reçu de vos voisins
- Entrez 0.001 SepETH et confirmez

## 1.2.4 - Visualisation du transfert

Utilisez de nouveau [Etherscan](https://sepolia.etherscan.io) pour visualiser
votre compte.
Cherchez quel lien il faut cliquer pour voir le compte de vos voisins.

# 1.3 - Préparer la configuration de `Brownie`

[Brownie](https://eth-brownie.readthedocs.io/en/stable/) est un outil de développement et
de teste pour écrire des smart contracts pour Ethereum.
Brownie réunit tous les outils nécessaires pour intéragir avec Ethereum:

- un compilateur pour traduire un smart contract dans un format convenable pour Ethereum
- une blockchain de test locale pour faire les premiers pas
- les outils nécessaires pour envoyer et intéragir avec un smart contract

Ici, on va configurer cet outil avec la clé privée et un accès supplémentaire nécessaire
pour le bon fonctionnement.

## 1.3.1 - Créer le fichier `.env`

Afin de pouvoir envoyer des commandes à la chaîne de teste "Sepolia", il faut configurer
le fichier `.env`.
Le plus simple est de copier le fichier `env.example` dans le fichier `.env`.

- ouvrez le fichier `env.example` avec Thonny (n'oubliez pas d'utiliser `all files`)
- `Fichier` -> `Enregistrer sous`
  - changer le nom en `.env`
  - sélectionnez `all files` en bas à droite
  - enregistrez avec `OK`

## 1.3.2 - Copier la clé privée

Maintenant, vous pouvez copier la clé privée dans votre fichier `.env`:
- `PRIVATE_KEY` se trouve dans votre fichier `NOTES.md` 
- copiez/collez la clé privée depuis la fenêtre dans le fichier `.env`

## 1.3.3 - Ajouter la clé API de Infura

Pour communiquer avec la blockchain, il vous faut un intermédiaire.
Ici, on va choisir Infura, et il faut créer un compte.
Allez sur

[Register Infura](https://app.infura.io/register)

et entrez votre nom (vous pouvez mettre n'importe quoi) et votre email.
Il est important que l'email soit correcte, parce qu'ils vous envoient
un lien qu'il faut pour confirmer.

Une fois la régistration confirmée, vous pouvez créer une clé d'accès.
Cette clé vous permet de vous identifier auprès d'Infura pour créer votre
contrat.

Cliquez sur `API Keys` en haut, puis `CREATE NEW API KEY`.
Choisissez `Web3 API` et donnez un nom, par exemple `Sismondi NFT`.
Quand la clé est créée, elle ne s'affiche qu'une seule fois!
Copiez/collez cette clé dans votre `.env` et c'est tout bon.

## 1.3.4 - Le `.env`

Votre `.env` doit maintenant contenir quelque chose comme ça.
Bien sûr que la clé privée et la clé d'accès auront des valeurs différentes!

```
PRIVATE_KEY = 41ede96cc603bf0d7a0e0bd67819ebaf5802ae8ea1060a4f6f3d8b9d723a24ea
WEB3_INFURA_PROJECT_ID = a691dd6311fb41eb6f3d8b9d723a24ea
```

## 1.3.5 - Vérifier le `.env`

Vous pouvez faire un test pour voir si tout a bien fonctionné en lançant la commande
suivante:

```bash
# Ceci coûte à peu près 0.007 SepoliaETH
./brownie.sh run test_env.py
```

Le test devrait prendre autour de 30 seconds et il va vous côuter quelques jetons.

# 2.1 - Configurer le contrat Sismondi_NFT avec vos images

Avant d'installer le contrat Sismondi_NFT sur la blockchain, il faut le configurer avec
vos images.
Il faut commencer par copier vos images sur l'ordinateur de l'EPFL.
Puis, il faut transformer les images pour qu'elles soient compatible avec le smart contract.
A la fin, il faut copier les images dans le smart contract.

## 2.1.1 - Préparation des images

- Copier les images dans les sous-répertoires de [./images] en remplaçant les images
qui sont déjà présentes
- Utiliser le script [./scripts/images.py] en ajoutant les images, y inclus le chemin
  - Avec Thonny, vous pouvez lancer `images.py` et voir la sortie 
  - Si vous avez de la peine avec les versions python, vous pouvez lancer ce script 
  avec la commande `./mk_images.sh`
- Il y a deux parties qu'il faut copier/coller dans le contrat `./contracts/SismondiNFT.sol`:
  - La partie `Prefix` doit suivre la déclaration d'`images_prefix`. 
  Ne pas oublier le `;` à la fin!
  - Les valeurs après le `Images are:` doivent remplacer ceux actuellement dans le
  tableau de `images`
- Vous pouvez aussi modifier la liste des mots qui est utilisé pour nommer vos NFTs.
Essayez de montrer de la maturité dans le choix de vos mots...

Chaque NFT se verra attribuer aléatoirement une des images et aussi aléatoirement un des
mots de la liste.

## 2.1.2 - Tester le contrat localement

Avant d'installer le contrat sur la blockchain Sepolia, on va d'abord le tester
localement.
Ceci peut assurer que vous n'avez pas fait d'erreur dans le copier/coller des images
dans le contrat.
Lancez la commande suivante:

```bash
./brownie.sh run sismondi.py deploy_mint --network development
```

Si tout va bien, vous devriez voir un total de 3 blocs:
- block 0: installation du contrat
- block 1: mint d'un premier NFT
- block 2: mint d'un deuxième NFT

## 2.1.3 - Installer le contrat sur le réseau de test Sepolia

Maintenant que vous avez mis à jour le contrat `SismondiNFT.sol`, et que vous
avez créé le fichier `.env`, vous êtes prêt·e·s!
Pour installer votre contrat `SismondiNFT.sol` sur la chaîne, vous pouvez
lancer la commande suivante:

```bash
./brownie.sh run sismondi.py deploy
```

Si tout se passe bien, vous devrez voir un commentaire qui se termine avec quelque
chose comme ceci:

```
Running 'scripts/sismondi.py::deploy'...
Transaction sent: 0x84096187a70ccfbdbb16546bbc250e72db949af3e726a5d0156222b7f7dc6f6d
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 0
  SismondiNFT.constructor confirmed   Block: 1   Gas used: 2816575 (23.47%)
  SismondiNFT deployed at: 0x3194cBDC3dbcd3E11a07892e7bA5c3394048Cc87

contract has been deployed successfully to : 0x3194cBDC3dbcd3E11a07892e7bA5c3394048Cc87
Terminating local RPC client...
```

Ce qui est le plus important, c'est le dernier long numéro, dans notre cas le
`0x3194cBDC3dbcd3E11a07892e7bA5c3394048Cc87`.
C'est l'adresse de votre contrat sur la blockchain!
Copiez cette adresse dans le fichier NOTES.md!

Note 1: cette commande va automatiquement compiler votre contrat `SismondiNFT.sol`.
Ça veut dire que vous pouvez changer le contrat dans votre éditeur, et puis directement
l'installer sur la blockchain.

Note 2: vous trouvez tous les messages dans le fichier `operations.log`.
Donc si vous avez oublié l'adresse de votre contrat, vous pouvez y jeter un coup
d'œil.

## 2.1.4 - Vérifier l'installation

Avec l'aide de l'outil [Etherscan](https://sepolia.etherscan.io), vous pouvez maintenant
vérifier que votre contrat est bel et bien installé sur la chaîne.
Entrez l'adresse du contrat que vous avez reçu en 2.1.3, et regardez ce que
Etherscan sait de votre contrat.
On verra qu'une fois que vous faites un "mint" sur ce contrat, Etherscan va ajouter
plus d'information.

# 2.2 - Utilisation du contrat

## 2.2.1 - Minter un NFT

Maintenant, vous êtes prêt·e·s pour faire un mint de votre premier NFT!
Parce que le contrat lui-même n'a encore rien minté, il n'y a pas encore de
NFT stocké dans le contrat!

Lancez la commande:

```bash
./brownie.sh run sismondi.py mint 0xADRESSE_CONTRAT
```

Vous devez remplacer `0xADRESSE_CONTRAT` par l'adresse que vous avez trouvé dans l'étape
`Création d'un contrat NFT`.
Si tout va bien, vous devez voir quelque chose comme ça:

```
Transaction sent: 0xb267bdc54994fe92746c21ca45853ae0d0f6d5d36461f92040462fae3558c407
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 1
  SismondiNFT.makeSismondiNFT confirmed   Block: 2   Gas used: 1493155 (12.44%)

A new NFT with id 0 has been successfully created in block 2 with transaction 0xb267bdc54994fe92746c21ca45853ae0d0f6d5d36461f92040462fae3558c407
```

Les numéros sont sûrement différents des vôtres.
Ce qu'il faut noter ici, c'est le `id 0`, qui signifie que c'est le premier NFT
créé par ce contrat. 

## 2.2.2 - Vérifier sur Etherscan

## 2.2.3 - Minter un NFT d'un autre groupe

Vous pouvez prendre l'adresse d'un contrat d'un autre groupe, afin de faire
du mint sur leur contrat à eux.
Quand ils vous donnent leur adresse, il faut d'abord vérifier que c'est bien
un contrat de mintage, à l'aide de [Etherscan](https://sepolia.etherscan.io).
Dans la partie `More Info`, il faudrait une mention de `Token Tracker`.
Si ce n'est pas le cas, ça peut être à cause de:
- une erreur dans la transmission de l'adresse
- que l'autre groupe n'a pas encore fait un premier mint

## Utilisation des NFTs

On va commencer par visualiser le NFTs qu'on vient de créer. 

## 2.2.4 - Suivi dans OpenSea

La visualisation avec le site OpenSea est possible même sans inscription.
Allez sur le site ici:

[OpenSea](https://testnets.opensea.io)

et entrez l'adresse de votre contrat NFT en haut dans la barre de recherche.
Si vous avez déjà minté un NFT, il devrait s'afficher ici.

## 2.2.5 - Ajout au portefeuille Metamask

Afin de transmettre le NFT, on peut utiliser Metamask:
- dans votre page de Metamask, cliquez sur `NFTs`, puis sur `Import NFT`
- ajoutez l'adresse de votre contrat, ainsi que le `id` de votre NFT

Vous ne pouvez pas ajouter un NFT que vous n'avez pas minté!

## 2.2.6 - Envoi vers d'autres utilisateurs

Pour envoyer votre NFT vers un autre utilisateur, vous devez d'abord
ajouter le NFT comme dans la section précédente.
Maintenant vous pouvez cliquer sur le NFT, et choisir `Send`.
On vous demande maintenant l'adresse du destinataire.

ATTENTION: une fois envoyé, il n'est pas possible de récupérer le NFT!
Donc si vous envoyez à une mauvaise adresse, le NFT est perdu!

# Documentation

- Transparents de la journée: [Blockchains et NFTs](https://docs.google.com/presentation/d/1x2FqWLHjh-F-auDqM0_eJ4Nv5r-jLTy-K3gfAH9umH8/edit?usp=sharing)
- Howto qui a été utilisé pour préparer la journée: [Deploy Your First NFT With Python](https://www.codeforests.com/2022/01/14/deploy-your-first-nft-with-python/) - 
    [Github with contract](https://github.com/codeforests/brownie_legendnft) 
- Contract utilisé pour le NFT: [openzeppelin-contracts](https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master) 
[Definition of ERC 721](https://docs.openzeppelin.com/contracts/4.x/api/token/erc721) 
- Réseaux de test Ethereum: https://ethereum.org/en/developers/docs/networks/