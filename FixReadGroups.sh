##This script is designed to fix the read groups of a BAM file as your process files through a bioinformatics file
##The results of this script will make sure that each file you are processing has the correct information
##This information includes sample name, Lane information, sex of the sample, sequencing platform, sample library, sample id
##There is very few information options that are required only the input file and output file
##For any information you wish to update and make sure is correct you simply will include that information with the correct option
##This files going into this script should have already gone through a step of analyzing fasta files and converting them to BAM files
##Typically this will involve the fasta files being quality checked and trimmed and then converted to sam then bam
## Fixing the read groups of the file is important, because by the time your sample is processed to a variant calling for analysis you need the sample information and the details correct so your analysis will be accurate

##Should run on 1 CPU, 20GB, for at least 5 days

#!/bin/sh

###################### Load Modules #######################

source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load picard/1.79

module load samtools

######################################################
###OPTIONS for script - there should be spaces in any of these options when you type them
##FLAGS
# I = Input file name, this file should be a sorted BAM file
# O = Output file name, this will also be a BAM file, you should add something to the file name so you know this file has gone through read group fix step
# RGID = This is the the sample ID information
# RGLB = This is were you can put the sample library information
# RGPL = This is where you can add the information on the platform the sample was sequenced on, a common option would be Illumina
# RGPU = This is where you can put the lane information from the sequencing, 
# RGSM = This is were you can update the sample name information
# RGDA = This is where you can update the sex of the sample



##########################################################

#####Defining the path to the picard script location######
picard_rg_path="/opt/asn/apps/picard_1.79/picard-tools-1.79/AddOrReplaceReadGroups.jar"

java -jar $picard_rg_path I= InoutFile.sorted.bam O=OutputFile.rg.bam RGID=SampleInformation \
RGLB=SampleLibraryInformation RGPL=Illumina_SamplePlatform RGPU=PS35299_SampleLane \
RGSM=Sample_Name RGDS=Sample_Sex\



