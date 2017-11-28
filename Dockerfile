############################################################
# Dockerfile: CentOS7/MinerGate-CLI
# Headless Minergate Command Line Interface
#
# Default cpu mining Monero(XMR)
#
# Usage:
# docker run -d --name xmr --net=host carbonsphere/minergate-cli -u yourMinerGateEmail@home.com --xmr
#
# Version:
# MinerGate cli v.6.2
#
# *** Remember to change user flag to your minergate email account.
# If not, you'll be mining for me, which I am appreciated.
#
# Donation Address
# ----------------
# BTC: 395vsb41m46voFyhrgYMh6TauWKmNqJAtm
# ETH: 0xB205A4560BBc9840b80d36245333401E65d4f05e
# XMR: 46duR7umVuuCaAeVc27L1aXk4vJikNm81Xf2YbRkxDU3Nz69gTporVjbNkia6wkHc2BfYcH2xYPBY6m9t7AVQZU61dWmFro
# IOTA: IGTKRHHTOIAHB9HCYIZNLPASKHEENKIJICZCCJSUXNZGFKYRLNOJQ9TMXIJYFUBLQ9YWXRMSMWXNDQWD9QINXNXOXW 
#
# Buy ETH or BTC with USD / Credit Card from CoinBase.com to get Free $10 BTC
# https://www.coinbase.com/join/59fd2b2af2e50b01171a4ae6
#
############################################################

FROM centos:centos7

MAINTAINER CarbonSphere <CarbonSphere@gmail.com>

ENV HOME                        /root
ENV TERM                        xterm

RUN yum install -y wget epel-release

RUN wget https://minergate.com/download/rpm-cli -O minergate.rpm
RUN yum install -y minergate.rpm && yum clean all
RUN rm -rf minergate.rpm

ENTRYPOINT ["minergate-cli"]
CMD ["-u", "carbonsphere@gmail.com", "--xmr"]
