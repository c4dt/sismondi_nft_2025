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

[Metamask](https://metamask.io/)

### Faucets:
[Faucet](https://sepolia-faucet.pk910.de)

### Etherscan

[Etherscan](https://sepolia.etherscan.io)

## NFTs

### Intro

### Préparation des images

- Utiliser le script [scripts/images.py]
- Entrer les images dans [scripts/sismondi.py]

### Création d'un contrat NFT

Localement sur la chaîne de développement:

```bash
./brownie.sh run sismondi.py deploy
```

Avec un `--network sepolia` à la fin, c'est plus sérieux: on va se mettre sur la chaîne de test.

### Minter un NFT

Localement sur la chaîne de développement:

```bash
./brownie.sh run sismondi.py deploy_mint
```

Ou sur la chaîne de test:

```bash
./brownie.sh run sismondi.py mint 0xcontract_id_in_hex --network sepolia
```

## Utilisation des NFTs

### Ajout au portefeuille Metamask

### Suivi dans OpenSea

https://opensea.io/

### Envoi vers d'autres utilisateurs

???

## Installation locale

Pour l'installation locale, il faut commencer à installer docker:

[Commencer avec Docker](https://www.docker.com/get-started/)

Puis on peut préparer l'image avec:

```
docker compose build
```

Après on peut utiliser `./brownie.sh`

## Documentation

- Howto on which the hands-on is based: [Deploy Your First NFT With Python](https://www.codeforests.com/2022/01/14/deploy-your-first-nft-with-python/) - 
    [Github with contract](https://github.com/codeforests/brownie_legendnft) 
- Contract used in the hands-on: [openzeppelin-contracts](https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master) 
[Definition of ERC 721](https://docs.openzeppelin.com/contracts/4.x/api/token/erc721) 