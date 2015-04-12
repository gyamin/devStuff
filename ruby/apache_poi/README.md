Using Apache POI by ruby
==============================

## Outline
Ruby has some libraries for dealing with excel file.
ex.      
+ spredsheet 
+ 

However these libraries are not completed and not so useful. A librariy can not write files, another librariy can not read file, just only makes new file.  
Apache POI is a almost completed java library to deal with excel file. Ruby has jruby!. jruby + Apache POI might be a best choice for dealing excel by ruby.

## Enviroment building

Enviroment setting.
```
$ cd src/
$ ruby -v
jruby 1.7.19 (1.9.3p551)
$ rbenv gemset active
.gems global
```

## Prepare Apache POI librariy

```
$ mkdir -p lib/java
$ cd lib/java/
$ ls
poi-3.11
$ tree poi-3.11/
poi-3.11/
├── LICENSE
├── NOTICE
├── lib
│   ├── commons-codec-1.9.jar
│   ├── commons-logging-1.1.3.jar
│   ├── junit-4.11.jar
│   └── log4j-1.2.17.jar
├── ooxml-lib
│   └── xmlbeans-2.6.0.jar
├── poi-3.11-20141221.jar
├── poi-examples-3.11-20141221.jar
├── poi-excelant-3.11-20141221.jar
├── poi-ooxml-3.11-20141221.jar
├── poi-ooxml-schemas-3.11-20141221.jar
└── poi-scratchpad-3.11-20141221.jar
```
