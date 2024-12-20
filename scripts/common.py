from brownie import network, config, accounts, chain, web3, Wei

import logging, sys, time
logging.basicConfig(filename='operations.log', encoding='utf-8', level=logging.INFO)

if network.show_active() == "development":
    account = accounts[0]
else:
    account = accounts.add(config["wallets"]["from_key"])
    priority = 5_000_000_000
    network.priority_fee(priority)
    network.max_fee(chain.base_fee + priority)

def log_cost(tx_receipt):
    gas_used = tx_receipt.gas_used
    gas_price = tx_receipt.gas_price
    eth_spent = gas_used * gas_price / (10**18)
    log(f"Cost was {eth_spent:.4f} SepoliaETH")

def log(txt):
    print(txt)
    logging.info(txt)
    sys.stdout.flush()

max_price = 100
max_price_wei = Wei(f"{max_price} gwei")

def check_gas(nowait = False):
    if nowait:
        if web3.eth.gasPrice > max_price_wei:
            log(f"Gas price: {Wei(web3.eth.gasPrice).to('gwei'):.1f} > {max_price} - continuing anyway")

    else:
        i = 6
        while web3.eth.gasPrice > max_price_wei and i > 0:
            log(f"Gas price: {Wei(web3.eth.gasPrice).to('gwei'):.1f} > {max_price} - waiting 10 seconds. Paying any price in {i*10} seconds.")
            time.sleep(10)
            i -= 1

def main():
    check_gas()