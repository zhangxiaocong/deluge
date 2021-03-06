Content
=================

* [Concept](#concept)
* [How?](#how?)
* [For programmers](#for-programmers)
   * [Parts and technologies](#parts-and-technologies)
   * [Interaction](#interaction)

* [For clients](#for-clients)
    * Widget integration
    * Widget statistic

* [For users](#for-users)
    * how pay for smart contracts with BTC?
    * how I get money back from smart contract?
    * do you take any fee?

* [For investors](#for-investors)
    * how you will get the money?
    * what volume of smart contracts transactions today?
    * how long the development may take?
    * how many clients already want to integrate this solution?
    * how many users struggles from being not able to pay for smart contract with BTC?
* [Todo](#todo)

Concept
=================
`Absortium` - service which allows to pay for `Ethereum` smart contracts by `BTC`. We are very excited by new technologies, built on blockchain and we believe in the future of it and particulary in `Ethereum` and smart contracts, we want to be part of the future. We love the openness and believe that it is the only way to achieve true security and transparency, so that is why all our sources are publicly available, and you can watch our activity and check all the code we produce.

How?
=================
We want to do this by creating widget which will be embedded on the sites, something like `coinbase` or `shapeshift` widget but more targeted on smart contracts. We will exchange `BTC` on `ETH` by integration with `Poloniex` and `Kraken` exhanges and send `ETH` on behalf of user, than if smart contract send `ETH` back we will do the reverse operation - exhange `ETH` on `BTC` and send it to the `BTC` sender address. Also we want provide statistics to the smart contracts creators.

For programmers
=================
## Parts and technologies
* [frontend](https://github.com/absortium/frontend) - UI for creating the ETH/BTC addresses, exchange `BTC` on `ETH` and visa versa, deposit, withdraw money.
    * `react`
    * `redux`
    * `webpack`
    * `nodejs`
    * `material-ui`
* [backend](https://github.com/absortium/backend) - backend for creating/canceling/updating/appoving orders.
    * `django`
    * `postgresql`
    * `celery`
    * `rabbitmq`
    * `crossbar.io`
* [ethwallet](https://github.com/absortium/ethwallet) - service which acts as coinbase ETH wallet (no longer needed because coinbase anounce ETH integration)
    * `postgresql`
    * `celery`
    * `rabbitmq`
    * `geth`
* [poloniexbot](https://github.com/absortium/poloniexbot) - service which is retranslate orders from Absortium to Poloniex.
    * `asyncio`
    * `postgresql`
    * `celery`
    * `rabbitmq`

## Interaction
![Schema](docs/schema.png)

Todo
=================
- [x] Create system for exchange `BTC`on `ETH` and visa versa. ([backend](https://github.com/absortium/backend))
- [x] Make integration with [Poloniex](http://poloniex.com) to get liquidity. ([poloniexbot](https://github.com/absortium/poloniexbot))
- [ ] Create widget.
