# Sismondi NFT demo

Ce répertoire contient le demo pour la semaine des étudiants du gymnase Sismondi.
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

## Blockchains

### Intro

### Réseaux de test

https://ethereum.org/en/developers/docs/networks/

## Le porte-feuille - "the wallet"

Pour finaliser l'expérience avec les NFTs, vous avez besoin d'un porte-feuille.
Ce porte-feuille s'appelle "Wallet" en Anglais et contient vos clés privées pour
la blockchain.
Ces clés privées sont comme un mot de passe, mais beaucoup plus long, et avec des
propriétés mathématiques intéressantes pour les blockchains.
Si quelqu'un réussi à copier vos clés privées, cette personne a le même accès que vous
à votre porte-feuille.
Donc ne donnez votre clé privée à personne!
Le porte-feuille Metamask demande un mot de passe qui protègera vos clés privées.
Pour sécuriser, il est conseillé d'écrire le "recovery phrase" quelque part.

On utilisera ici le porte-feuille le plus connu: Metamask.

### ATTENTION! SCAMS! VOLS!

### Installation Metamask

Aller sur le site de Metamask et suivre les instructions d'installation:

[Installer Metamask](https://metamask.io/download/)

Deux choses importantes:
- écrivez votre mot de passe quelque part, si possible sur une feuille de papier,
ou dans un gestionnaire de mot de passe
- copier les mots de récupération dans un document sur l'ordinateur, ou l'écrire sur une
feuille de papier

### Faucets:

Pour la prochaine étape, vous avez besoin de quelques jetons.
Les réseaux blockchains de test vous permettent de recevoir des jetons gratuits.
Bien sûr que vous ne pouvez pas revendre ces jetons, ils ne valent rien.
Afin de recevoir quelques jetons, vous pouvez copier votre adresse depuis Metamask
dans le robinet suivant:

[Faucet](https://sepolia-faucet.pk910.de)

L'adresse PUBLIQUE commence avec un `0x` et contient des chiffres et des lettres a-f.

Une fois le robinet ouvert, vous attendez quelques minutes pour avoir 0.1 ETH.
C'est suffisant pour le moment.
Quand le montant est atteint, cliquez sur "Stop Mining" et attendez que vos jetons
se trouvent sur votre compte.

### Etherscan

Vous pouvez aussi entrer votre adresse publique sur le site suivant, afin de
suivre les transactions sur votre compte et depuis votre compte:

[Etherscan](https://sepolia.etherscan.io)

## NFTs

### Intro

### Préparation des images

- Copier les images dans les sous-répertoires de [./images] en remplaçant les images
qui sont déjà présentes
- Utiliser le script [./scripts/images.py] en ajoutant les images, y inclus le chemin
- Entrer les images converties dans [./scripts/sismondi.py] pour remplacer la valeur unique
actuellement dans la variable `images`.

## Configurez l'intéraction avec la chaîne "Sepolia"

Afin de pouvoir envoyer des commandes à la chaîne de teste "Sepolia", il faut configurer
le fichier `.env`.
Le plus simple est de copier le fichier `env.example` dans le fichier `.env`.

### Ajouter la clé privée

Maintenant, il faut remplacer les variables qui s'y trouvent:
- `PRIVATE_KEY` se trouve dans la "wallet" Metamask: 
  - cliquer sur les trois petits points à droite du nom de votre compte
  - choisissez "Account details", puis "Show private key"
  - confirmez avec votre mot de passe
  - appuyez longuement sur le bouton
  - copiez/collez la clé privée depuis la fenêtre dans le fichier `.env`

### Ajouter la clé de Infura

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

### Le `.env`

Votre `.env` devrait maintenant contenir quelque chose comme ça.
Bien sûr que la clé privée et la clé d'accès auront des valeurs différentes!

```
PRIVATE_KEY = 41ede96cc603bf0d7a0e0bd67819ebaf5802ae8ea1060a4f6f3d8b9d723a24ea
WEB3_INFURA_PROJECT_ID = a691dd6311fb41eb6f3d8b9d723a24ea
```

## Création d'un contrat NFT

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
C'est l'adresse de notre contrat sur la blockchain!

Note 1: cette commande va automatiquement compiler votre contrat `SismondiNFT.sol`.
Ça veut dire que vous pouvez changer le contrat dans votre éditeur, et puis directement
l'installer sur la blockchain.

Note 2: vous trouvez tous les messages dans le fichier `operations.log`.
Donc si vous avez oublié l'adresse de votre contrat, vous pouvez y jeter un coup
d'œil.

### Minter un NFT

Maintenant, vous êtes prêt·e·s pour faire un mint de votre premier NFT!
Parce que le contrat lui-même n'a encore rien minté, il est juste prêt
pour le faire.

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
créée par ce contrat. 

### Minter un NFT d'un autre groupe

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

### Suivi dans OpenSea

La visualisation avec le site OpenSea est possible même sans inscription.
Allez sur le site ici:

[OpenSea](https://testnets.opensea.io)

et entrez l'adresse de votre contrat NFT en haut dans la barre de recherche.
Si vous avez déjà minté un NFT, il devrait s'afficher ici.

### Ajout au portefeuille Metamask

Afin de transmettre le NFT, on peut utiliser Metamask:
- dans votre page de Metamask, cliquez sur `NFTs`, puis sur `Import NFT`
- ajoutez l'adresse de votre contrat, ainsi que le `id` de votre NFT

Vous ne pouvez pas ajouter un NFT que vous n'avez pas minté!

### Envoi vers d'autres utilisateurs

Pour envoyer votre NFT vers un autre utilisateur, vous devez d'abord
ajouter le NFT comme dans la section précédente.
Maintenant vous pouvez cliquer sur le NFT, et choisir `Send`.
On vous demande maintenant l'adresse du destinataire.

ATTENTION: une fois envoyé, il n'est pas possible de récupérer le NFT!
Donc si vous envoyez à une mauvaise adresse, le NFT est perdu!

## Installation locale

Pour l'installation locale, il faut commencer à installer docker:

[Commencer avec Docker](https://www.docker.com/get-started/)

Puis, on peut préparer l'image avec:

```
docker compose build
```

Après, on peut utiliser `./brownie.sh`

## Documentation

- Howto on which the hands-on is based: [Deploy Your First NFT With Python](https://www.codeforests.com/2022/01/14/deploy-your-first-nft-with-python/) - 
    [Github with contract](https://github.com/codeforests/brownie_legendnft) 
- Contract used in the hands-on: [openzeppelin-contracts](https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master) 
[Definition of ERC 721](https://docs.openzeppelin.com/contracts/4.x/api/token/erc721) 