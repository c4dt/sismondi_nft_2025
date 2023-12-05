from ape import accounts, compilers

CODE = """
   ... source code here
"""

container = compilers.compile_source(
   "vyper",
   CODE,
   settings={"vyper": {"version": "0.3.7"}}, 
   contractName="MyContract",
)

owner = accounts.test_accounts[0]

instance = container.deploy(sender=owner)
