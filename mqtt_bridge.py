import sys
import paho.mqtt.client as mqtt

msg = sys.argv[1] if len(sys.argv) > 1 else "Chamada SIP recebida"

mqttc = mqtt.Client()
mqttc.connect("172.19.0.2", 1883, 60)
mqttc.publish("sip/events", msg)
mqttc.disconnect()

