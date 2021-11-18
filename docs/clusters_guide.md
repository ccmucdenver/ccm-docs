d you enter it at this point.

Science will then occur and you should be at the clas-compute prompt and in your home directory.

###Interactive Use

Using a server ‘interactively’ (aka not scheduling a job) is often needed for troubleshooting a job or just watching what it is doing in real time. After SSH’ing into math-compute, you can type <code>ssh math-colibri-i01</code> or whatever server you want to go directly to the server. **Please do not run anything directly on compute nodes, which are reserved for jobs under the control of the scheduler, even if you may be able to ssh there.  These are nodes with names like math-colibri-c01 with the "c" before the number. Using compute nodes, where other people run jobs through the scheduler, will interfere with their work and make you very unpopular.**


Using 'screen' is generally a good idea both a head node or the interactive nodes. Basically was screen does is starts a virtual terminal inside your terminal. Sound confusing? It is. The plus of this virtual terminal is if you get disconnected, whatever you were running is still going.

'screen –S bananaphone' (make the name whatever you want) creates a new terminal with that name

If you want to disconnect from the screen but leave it running, hit the combination of Control-A and press the D key to disconnect. Control-A is the combo to let screen know you want to do an action.

When you want to reconnect to the screen later, log back onto wherever you started the screen and type <code>screen –r</code>. If you have more than one screen, it’ll complain and tell you the screens you have available to reconnect to. <code>screen –r ‘bananaphone’</code> to reconnect to that screen. Sometimes there is a number in front of the screen so <code>screen –r 3128.bananaphone</code>. It’ll tell you the number in the <code>screen –r</code> info screen.

###File Storage

Math home directories are on a shared server with 40TB total (right now). Projects are found in /storage/department/projects (where department may be one of many departments who use this system).

For example, the mixtures project is in <code>/storage/math/projects/mixtures</code>.

If you need a lot of data storage, please contact Joe before filling everything you can find.

df –h will show you the storage arrays and how much space is available. There are different types of "empty" space in linux so it may say there is plenty of space in df –h yet the array is full.

###Passwords

The system uses your normal UCD portal/email logon username and password. Users must be approved before using the system, so if your login is not working, you probably are not on the approved/initialized list yet.

##Requesting information about the environment

###Queues

There are queues for different departments on math-compute because it points to a central scheduler for all of CLAS. To see these queues type 

    $ sinfo
    PARTITION         AVAIL  TIMELIMIT  NODES  STATE NODELIST
    math-alderaan        up 4-00:00:00     32  down* math-alderaan-c[01-32]
    math-alderaan-gpu    up 4-00:00:00      1  down* math-alderaan-h01
    math-alderaan-gpu    up 4-00:00:00      1   unk* math-alderaan-h02
    math-colibri-gpu     up   infinite     12   unk*
    math-colibri-c[01-02,04-12,23]
    math-colibri-gpu     up   infinite     12   idle math-colibri-c[03,13-22,24]
    math-score           up   infinite      5   unk* math-score-c[01-05]
    chem-xenon           up   infinite      6   unk* chem-xenon-c[01-06]

###Nodes
To see a list of all nodes, use:

     $ sinfo -N
     NODELIST           NODES         PARTITION STATE 
     chem-xenon-c01         1        chem-xenon unk*  
     chem-xenon-c02         1        chem-xenon unk*  
     chem-xenon-c03         1        chem-xenon unk*  
     chem-xenon-c04         1        chem-xenon unk*  
     chem-xenon-c05         1        chem-xenon unk*  
     chem-xenon-c06         1        chem-xenon unk*  
     clas-rcdesktop-01      1    clas-rcdesktop down* 
     math-alderaan-c01      1     math-alderaan alloc 
     math-alderaan-c02      1     math-alderaan alloc 
     math-alderaan-c03      1     math-alderaan alloc 
     math-alderaan-c04      1     math-alderaan alloc 
     math-alderaan-c05      1     math-alderaan alloc 
     math-alderaan-c06      1     math-alderaan alloc 
     math-alderaan-c07      1     math-alderaan alloc 
     math-alderaan-c08      1     math-alderaan alloc 
     math-alderaan-c09      1     math-alderaan alloc 
     math-alderaan-c10      1     math-alderaan alloc 
     math-alderaan-c11      1     math-alderaan alloc 
     math-alderaan-c12      1     math-alderaan alloc 
     math-alderaan-c13      1     math-alderaan alloc 
     math-alderaan-c14      1     math-alderaan alloc 
     math-alderaan-c15      1     math-alderaan alloc 
     math-alderaan-c16      1     math-alderaan mix   
     math-alderaan-c17      1     math-alderaan idle  
     math-alderaan-c18      1     math-alderaan idle  
     math-alderaan-c19      1     math-alderaan idle  
     math-alderaan-c20      1     math-alderaan idle  
     math-alderaan-c21      1     math-alderaan idle  
     math-alderaan-c22      1     math-alderaan idle  
     math-alderaan-c23      1     math-alderaan idle  
     math-alderaan-c24      1     math-alderaan idle  
     math-alderaan-c25      1     math-alderaan idle  
     math-alderaan-c26      1     math-alderaan idle  
     math-alderaan-c27      1     math-alderaan idle  
     math-alderaan-c28      1     math-alderaan idle  
     math-alderaan-c29      1     math-alderaan idle  
     math-alderaan-c30      1     math-alderaan idle  
     math-alderaan-c31      1     math-alderaan idle  
     math-alderaan-c32      1     math-alderaan idle  
     math-alderaan-h01      1 math-alderaan-gpu idle  
     math-alderaan-h02      1 math-alderaan-gpu idle  
     math-colibri-c01       1  math-colibri-gpu idle  
     math-colibri-c02       1  math-colibri-gpu idle  
     math-colibri-c03       1  math-colibri-gpu idle  
     math-colibri-c04       1  math-colibri-gpu unk*  
     math-colibri-c05       1  math-colibri-gpu unk*  
     math-colibri-c06       1  math-colibri-gpu unk*  
     math-colibri-c07       1  math-colibri-gpu unk*  
     math-colibri-c08       1  math-colibri-gpu unk*  
     math-colibri-c09       1  math-colibri-gpu unk*  
     math-colibri-c10       1  math-colibri-gpu unk*  
     math-colibri-c11       1  math-colibri-gpu unk*  
     math-colibri-c12       1  math-colibri-gpu unk*  
     math-colibri-c13       1  math-colibri-gpu idle  
     math-colibri-c14       1  math-colibri-gpu idle  
     math-colibri-c15       1  math-colibri-gpu idle  
     math-colibri-c16       1  math-colibri-gpu idle  
     math-colibri-c17       1  math-colibri-gpu idle  
     math-colibri-c18       1  math-colibri-gpu idle  
     math-colibri-c19       1  math-colibri-gpu idle  
     math-colibri-c20       1  math-colibri-gpu idle  
     math-colibri-c21       1  math-colibri-gpu idle  
     math-colibri-c22       1  math-colibri-gpu idle  
     math-colibri-c23       1  math-colibri-gpu idle  
     math-colibri-c24       1  math-colibri-gpu idle  
     math-score-c01         1        math-score unk*  
     math-score-c02         1        math-score unk*  
     math-score-c03         1        math-score idle  
     math-score-c04         1        math-score idle  
     math-score-c05         1        math-score idle  



It looks confusing but there is a method to the madness in the naming convention. Obviously, math-colibri and math-score are the identifiers for what cluster/building the servers are in, but the –c## and –i## stand for compute and interactive. the c## servers are usually part of the queuing system and the i## ones are for interactive use. Again, never ssh to compute nodes directly.

##Scheduler Instructions

###Submitting a job

The <code>sbatch</code> command is used to submit a job into a queue. Your job should be a script that is accessible to the compute nodes. You can add switches to the <code>sbatch</code> command, but it is recommended to make them a part of your batch script. Here is a sample SLURM batch script: COMING SOON

##Viewing queues and job status

The <code>squeue</code> command is used to gather information from the scheduler. Some of the most common switches are: COMING SOON

