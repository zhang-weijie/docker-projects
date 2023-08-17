#!/usr/bin/python3

import os
import threading

inside_thread = threading.Thread(target = os.system,args = ("docker-compose up",))
outside_thread = threading.Thread(target = os.system,args = ("./set_application.sh root 166414 3306 master_slave_replication_db",))

inside_thread.start()
outside_thread.start()

inside_thread.join()
outside_thread.join()
