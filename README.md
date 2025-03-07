# ZigBeeNet
We present a decrypted ZigBee IoT network traffic dataset in a smart home environment. We use 15 devices in total, six different types of devices (Hub, Power Plug, Smart Light, Smart Bulb, Wall Switch, and Motion Sensor) and nine different devices. We have collected data from 20 days. We were using a Zigbee Sniffer based on the Texas Instruments CC2531 chip and a Wireshark plugin to capture data to pcap files. 

The dataset is a result of our work published in the journal Applied Science. For more detailed information about the dataset and zigbee network traffic characteristics, you can access the scientific article from the link below. Please cite the article to use this dataset.

https://www.mdpi.com/2076-3417/14/23/10844

 ## **ZigBee Device List**

Hub
* Hue Bridge
  
Power Plug
* Hue Smart Plug

Smart Light
* Hue White and Color Ambiance Play #1
* Hue White and Color Ambiance Play #2
* Hue Go

Smart Bulb
* Hue White and Color Ambiance Bulb #1
* Hue White and Color Ambiance Bulb #2
* Hue White Ambiance Bulbs #1
* Hue White Ambiance Bulbs #2
* Hue White Ambiance Bulbs #3
* Lidl Livarno RGB Bulb #1
* Lidl Livarno RGB Bulb #2

Wall Switch
* Hue Dimmer Switch #1
* Hue Dimmer Switch #2

Motion Sensor
* Hue Motion Sensor

## Download dataset

You can download the dataset from Zenodo library [here](https://doi.org/10.5281/zenodo.13957306).

## How to open the dataset?

#### 1. Install Wireshark
To analyze the dataset, you'll need to have Wireshark installed. You can download it from the [Wireshark official website](https://www.wireshark.org/download.html) and follow the installation instructions for your operating system.

#### 2. Download the Dataset
Download the dataset from the Zenodo library. You can find it at the provided link above.

#### 3. Extract the Dataset
Once you've downloaded the dataset (a `.tar.gz` file), you need to extract it. You can use the following command in your terminal:

```bash
tar -xzvf dataset.tar.gz
```

Alternatively, you can use software like [7-Zip](https://www.7-zip.org/) to extract the contents if you're on Windows.

#### 4. (Optional) Merge PCAP Files
The dataset contains multiple PCAP files that need to be merged if you want to analyze all packets, use the script located at `scripts/merger.sh`. Run it as follows:

```bash
bash scripts/merger.sh
```

This script will help you combine multiple `.pcap` files into one for easier analysis.

#### 5. Open the PCAP File in Wireshark
Once the dataset is extracted, open the `.pcap` file in Wireshark by either double-clicking the file or selecting `File -> Open` in Wireshark.

#### 6. Adjust IEEE 802.15.4 Protocol Settings
To properly analyze the Zigbee packets, you need to configure Wireshark to interpret the data correctly:

- Go to `Edit -> Preferences -> Protocols -> IEEE 802.15.4`.
- Change the "FCS format" to **TI CC24xx metadata**.
- Check the option **Enable ACK tracking**.

#### 7. Configure Zigbee Network Key
To decrypt Zigbee traffic and view the payload of individual packets:

- Go to `Edit -> Preferences -> Protocols -> Zigbee -> Pre-configured keys`.
- Add the following **network key**:  
  `13:CE:8C:B5:C1:FC:6F:20:8D:63:83:3D:59:D4:FA:2A`.

#### 8. View Decrypted Data
Now, all the packet data should be visible in Wireshark, including the decrypted payload of Zigbee packets. You can inspect individual packets, see their payloads, and analyze the communication within the Zigbee network.





