#!/usr/bin/python3.9
import sys, string, os, subprocess, threading

pwd = "/home/alex/www/OptimizedHTML-4-master/app/"
os.chdir(pwd)
print("Текущая деректория:\n", os.getcwd())

# Function start
def gulp():
    """ Запуск gulp """
    os.system('/usr/bin/gulp')

def index():
    os.system('/usr/local/bin/st -e /usr/bin/nvim /home/alex/www/OptimizedHTML-4-master/app/index.html')

if __name__ == "__main__":
    # creating thread
    t1 = threading.Thread(target=gulp, args=())
    t2 = threading.Thread(target=index, args=())

    # starting thread 1
    t1.start()
    t2.start()

    # wait until thread 1 is completely executed
    t1.join()
    t2.join()

    # both threads completely executed
    print("Done!")
