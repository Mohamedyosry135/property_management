#!/usr/bin/env python3
import json
import os
import time
from watchdog.observers import Observer
from watchdog.events import PatternMatchingEventHandler
import code
import yaml

def buildYaml():
    with open('pubspec.yaml') as f:
        data = yaml.safe_load(f)
    fileNames = set([])
    fileNames.add("assets/")
    fileNames.add("assets/svg_icons/")

    foldersNames_svg = os.listdir("assets/images")
    for folderName in foldersNames_svg:
        if folderName != ".DS_Store":
            for fileName in os.listdir("assets/images/"+folderName):
                fileNames.add("assets/images/"+fileName)

    fileNames = filter(lambda item: ".DS_Store" not in item, fileNames)

    print (fileNames)
    data['flutter']['assets'] = list(fileNames)
    with open('pubspec.yaml', 'w') as f:
        yaml.dump(data, f)

def buildStrings():
    # Remove strings.dart file
    if os.path.exists("lib/resources/strings_generated.dart"):
        os.remove("lib/resources/strings_generated.dart")
    # create new strings.dart file
    newFile = open("lib/resources/strings_generated.dart", "a+")
    # open connection with the english json file
    english_strings_file = open("assets/locale_en.json", "r")

    # start writing imports and class name
    newFile.write("import 'package:get/get.dart';" + "\n")
    newFile.write("class AppStrings {" + "\n")
    # read json data
    jsonData = json.load(english_strings_file)

    # parsing
    for key in jsonData:
        varName = ""
        varNameList = key.split("_")
        for idx, val in enumerate(varNameList):
            varName += val.lower() if idx == 0 else val.capitalize()

        if "%s" in jsonData[key]:
            print("build functions")
            newFile.write("static String "+varName + "(List<String> items){"+"\n"+
                          "String str = \""+key+"\".tr;"+"\n"+
                          "items.forEach((element) { str.replaceFirst(\"%s\", element);});"+"\n"+
                          "return str;}"+"\n")
        else:
            # writing variables
            newFile.write("static String get "+varName +
                          "{return \""+key+"\".tr;}"+"\n")

    newFile.write("}")
    # close connections
    newFile.close()
    english_strings_file.close()

def buildImages():
    # Remove strings.dart file
    if os.path.exists("lib/resources/assets_generated.dart"):
        os.remove("lib/resources/assets_generated.dart")
    # create new strings.dart file
    newFile = open("lib/resources/assets_generated.dart", "a+")

    # start writing imports and class name
    newFile.write("import 'package:flutter/material.dart';" + "\n")
    newFile.write("class AppAssets {" + "\n")
    # iterating all sub directories
    foldersNames = os.listdir("assets/images")

    fileNames = set([])

    for folderName in foldersNames:
        if folderName != ".DS_Store":
            for fileName in os.listdir("assets/images/"+folderName):
                fileNames.add(fileName)

    for item in fileNames:
        if item != ".DS_Store":
            varName = ""
            varNameList = item.split("_")
            for idx, val in enumerate(varNameList):
                varName += val if idx == 0 else val.capitalize()

            # writing variables
            stringToWrite = "static const AssetImage "+varName.split(".")[0]+" = AssetImage(\"assets/images/"+item+"\");"+"\n"
            newFile.write(stringToWrite)

    newFile.write("}")
    # close connections
    newFile.close()

def buildSVGImages():
    # Remove strings.dart file
    if os.path.exists("lib/resources/assets_svg_generated.dart"):
        os.remove("lib/resources/assets_svg_generated.dart")
    # create new strings.dart file
    newFile = open("lib/resources/assets_svg_generated.dart", "a+")

    # start writing imports and class name
    newFile.write("import 'package:flutter/material.dart';" + "\n")
    newFile.write("import 'package:flutter_svg/flutter_svg.dart'; " + "\n")
    newFile.write("class AppSVGAssets {" + "\n")
    # iterating all sub directories
    foldersNames = os.listdir("assets/svg_icons")

    fileNames = set([])

    for folderName in foldersNames:
        if folderName != ".DS_Store":
            for fileName in os.listdir("assets/svg_icons/"):
                fileNames.add(fileName)

    for item in fileNames:
        if item != ".DS_Store":
            varName = ""
            varNameList = item.split("_")
            for idx, val in enumerate(varNameList):
                varName += val if idx == 0 else val.capitalize()

            # writing variables
            stringToWrite = "static const "+varName.split(".")[0]+" = \"assets/svg_icons/"+item+"\";"+"\n"
            newFile.write(stringToWrite)
    newFile.write("""
     static SvgPicture getWidget(String assetName,{ BoxFit fit = BoxFit.none, Color? color,
      double? width, double? height}) {
    if (width != null && height != null) {
      return SvgPicture.asset(
        assetName,
        fit: fit,
        color: color,
        width: width,
        height: height,
      );
    }
    return SvgPicture.asset(
      assetName,
      fit: fit,
      color: color
    );
  }
    """)
    newFile.write("}")
    # close connections
    newFile.close()

def runScripts(data):
    print("recreating assets ...")
    buildStrings()
    buildImages()
    buildSVGImages()
    buildYaml()
print("assets created")

def main():
    patterns = "*"
    ignore_patterns = ""
    ignore_directories = False
    case_sensitive = True
    runScripts("")
    my_event_handler = PatternMatchingEventHandler(patterns, ignore_patterns, ignore_directories, case_sensitive)
    my_event_handler.on_created = runScripts
    my_event_handler.on_deleted = runScripts
    my_event_handler.on_modified = runScripts
    path = "./assets"
    go_recursively = True
    my_observer = Observer()
    my_observer.schedule(my_event_handler, path, recursive=go_recursively)
    my_observer.start()

    code.interact()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        my_observer.stop()
        my_observer.join()

if __name__== "__main__":
    main()