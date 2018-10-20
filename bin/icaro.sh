#!/bin/bash

#################################################################################################################################################
#                          							   					  			#
#              		ICARO - The software extracts the e-mail headers in a sequential and automatic way	V.1.0				#   	   
#				      														#
#																		#
#					    DEDICATED TO MY FAMILY AND MY GIRLFRIEND								#
#                              					  		   								# 
# 	(C) Copyright 2018-2100 by CARMELO BRANCATO									  	  		# 
#													                  			# 
# 		E-mail :            carmelobrancato@libero.it							  				# 
#															  			# 
#    Fingerpring sign gpg: F105A87E                    									  			# 
#										   								#
#  															   			#	  
#																		#
#    This program is free software: you can redistribute it and/or modify 									#
#																		#
#   it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or	#
#																		#
#    (at your option) any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 		#
#																		#
#   without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 							#
#     																		#
#    See the GNU General Public License for more details.											#
#																		#
#    You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.	#
#################################################################################################################################################

opt=$1
shift 1

######################################################################################################################################
#  CREAZIONE DELLA DIRECTORY DOVE VERRANNO CONSERVATI I REPERTI DELLE E-MAIL                                                         #
#                                                                                                                                    #
#                                                                                                                                    #
######################################################################################################################################
create_directory()
{
mkdir /path/Reperti/    ### CREAZIONE PATH DELLA DIRECTORY REPERTI PER LA CONSERVAZIONE DEI REPERTI, INSERIRE PATH DOVE CREARE LA DIRECTORY REPERTI. 

mkdir /path/Reperti/Copie_email/  #### CREAZIONE DELLA DIRECTORY Copie_email, PER AVERE LA DUPLICAZIONE DELLE E-MAIL PER ESTRARRE I DATI DALLE COPIE.INSERIRE PATH DOVE CREARE LA DIRECTORY REPERTI CHE CONTIENE LA DIRECTORY Copie_email.

mkdir /path/Reperti/Log/            #### CREAZIONE DELLA DIRECTORY Log, PER ARCHIVIARE I LOG DEI CHECKSUM . INSERIRE PATH DOVE CREARE LA DIRECTORY REPERTI CHE CONTIENE LA DIRECTORY Log

mkdir /path/Reperti/Estrazioni/     #### CREAZIONE DELLA DIRECTORY ESTRAZIONI, PER ARCHIVIARE LE ESTRAZIONI DEI REPERTAMENTI . INSERIRE PATH DOVE CREARE LA DIRECTORY REPERTI CHE CONTIENE LA DIRECTORY ESTRAZIONI

mkdir /path/Reperti/e_mail_orginali/   ### CREAZIONE DELLA DIRECTORY e_mail_originali PER ARCHIVIARE LE E-MAIL ORIGINALI . INSERIRE PATH DOVE CREARE LA DIRECTORY REPERTI CHE CONTIENE LA DIRECTORY e_mail_originali

mv  /path/E-mail_originali/*.eml /path/Reperti/e_mail_orginali/  ########LE E-MAIL IN ORIGINALE E VENGONO SPOSTATE NELLA DIRECTORY Reperti/E-mail_originali

cp -fi /path/Reperti/e_mail_orginali/*.eml /path/Reperti/Copie_email/ ######### COPIA DELLE E-MAIL NELLA DIRECTORY Copia_email
}

##############################################################################################################################################################################
# 						INIZIO OPERAZIONE DI ESTRAZIONE HEADERS E-MAIL                                               			             #
#                                                                                                                                           				     #
# CREAZIONE DEL CHECKSUM SHA256 E MD5 DELLE E-MAIL ORIGINALI, IL CHECKSUM SERVE PER DIMOSTRARE LA COERENZA TRA L'ORIGINALE E LA COPIA CIOÈ CHE I DATI NON SONO STATI ALTERATI#
# VIENE CREATO UN REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA              				     #
##############################################################################################################################################################################
inizio_operazione_estrazione ()
{
echo "INIZIO ESTRAZIONE HEADERS E-MAIL" >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
}

checksum_email1()
{
echo "CHECKSUM SHA256_E-MAIL 1" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE1.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE1.txt ;
for a in /path/Reperti/e_mail_orginali/1.eml;
do
sha256sum "$a" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE1.txt ; 
echo "CHECKSUM MD5_E-MAIL1" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE1.txt 
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE1.txt;
md5sum "$a" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE1.txt ;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE1.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
done ;
}

checksum_email2()
{
echo "CHECKSUM SHA256_E-MAIL 2" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE2.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE2.txt;
for b in /path/Reperti/e_mail_orginali/2.eml
do sha256sum "$b" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE2.txt ;
echo "CHECKSUM MD5_E-MAIL2" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE2.txt
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE2.txt;
md5sum "$b" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE2.txt
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE2.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt
done;
}
checksum_email3()
{
echo "CHECKSUM SHA256_E-MAIL 3" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE3.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE3.txt ;
for c in /path/Reperti/e_mail_orginali/3.eml
do sha256sum "$c" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE3.txt ;
echo "CHECKSUM MD5_E-MAIL3" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE3.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE3.txt;
md5sum "$c" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE3.txt;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE3.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
done;
}

checksum_email4()
{
echo "CHECKSUM SHA256_E-MAIL 4" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE4.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE4.txt ;
for d in /path/Reperti/e_mail_orginali/4.eml
do sha256sum "$d" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE4.txt ;
echo "CHECKSUM MD5_E-MAIL4" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE4.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE4.txt;
md5sum "$d" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE4.txt;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE4.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
done;
}
#####################DECOMMENTARE LE RIGHE SULLA BASE DELLA QUANTITÀ DI E-MAIL DA ANALIZZARE .
##checksum_email5()  	
##{
##echo "CHECKSUM SHA256_E-MAIL 5" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE5.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE5.txt ;
##for d1 in xxx.eml
##do sha256sum "$d1" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE5.txt ;
##echo "CHECKSUM MD5_E-MAIL5" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE5.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE5.txt;
##md5sum "$d1" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE5.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE5.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email6()
##{
##echo "CHECKSUM SHA256_E-MAIL 6" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE6.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE6.txt ;
##for d2 in xxx.eml
##do sha256sum "$d2" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE6.txt ;
##echo "CHECKSUM MD5_E-MAIL6" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE6.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE6.txt;
##md5sum "$d2" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE6.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE6.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email7()
##{
##echo "CHECKSUM SHA256_E-MAIL 7" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE7.txt;
## date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE7.txt ;
## for d3 in xxx.eml
## do sha256sum "$d" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE7.txt ;
## echo "CHECKSUM MD5_E-MAIL7" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE7.txt;
## date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE7.txt;
## md5sum "$d" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE7.txt;
## cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE7.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
## done;
## }

##checksum_email8()
##{
##echo "CHECKSUM SHA256_E-MAIL 8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE8.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE8.txt ;
##for d4 in xxx.eml
##do sha256sum "$d4" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE8.txt ;
##echo "CHECKSUM MD5_E-MAIL8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE8.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE8.txt;
##md5sum "$d4" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE8.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE8.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email9()
##{
##echo "CHECKSUM SHA256_E-MAIL 9" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE9.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE9.txt ;
##for d5 in xxx.eml
##do sha256sum "$d5" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE9.txt ;
##echo "CHECKSUM MD5_E-MAIL9" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE9.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE9.txt;
##md5sum "$d5" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE9.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE9.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email10()
##{
##echo "CHECKSUM SHA256_E-MAIL 10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE10.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE10.txt ;
##for d6 in xxx.eml
##do sha256sum "$d6" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE10.txt ;
##echo "CHECKSUM MD5_E-MAIL10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE10.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE10.txt;
##md5sum "$d6" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE10.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE10.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email11()
##{
##echo "CHECKSUM SHA256_E-MAIL 11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE11.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE11.txt ;
##for d7 in XXX.eml
##do sha256sum "$d7" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE11.txt ;
##echo "CHECKSUM MD5_E-MAIL11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE11.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE11.txt;
##md5sum "$d7" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE11.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE11.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email12()
##{
##echo "CHECKSUM SHA256_E-MAIL 12" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE12.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE12.txt ;
##for d8 in XXX.eml
##do sha256sum "$d8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE12.txt ;
##echo "CHECKSUM MD5_E-MAIL12" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE12.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE12.txt;
##md5sum "$d8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE12.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE12.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email13()
##{
##echo "CHECKSUM SHA256_E-MAIL 13" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE13.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE13.txt ;
##for d8 in XXX.eml
##do sha256sum "$d8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE13.txt ;
##echo "CHECKSUM MD5_E-MAIL13" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE13.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE13.txt;
##md5sum "$d8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE13.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE13.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email14()
##{
##echo "CHECKSUM SHA256_E-MAIL 14" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE14.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE14.txt ;
##for d9 in XXX.eml
##do sha256sum "$d9" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE14.txt ;
##echo "CHECKSUM MD5_E-MAIL14" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE14.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE14.txt;
##md5sum "$d9" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE14.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE14.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email15()
##{
##echo "CHECKSUM SHA256_E-MAIL 15" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE15.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE15.txt ;
##for d10 in XXX.eml
##do sha256sum "$d10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE15.txt ;
##echo "CHECKSUM MD5_E-MAIL15" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE15.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE15.txt;
##md5sum "$d10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE15.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE15.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email16()
##{
##echo "CHECKSUM SHA256_E-MAIL 16" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE16.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE16.txt ;
##for d11 in XXX.eml
##do sha256sum "$d11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE16.txt ;
##echo "CHECKSUM MD5_E-MAIL16" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE16.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE16.txt;
##md5sum "$d11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE16.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE16.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email17()
##{
##echo "CHECKSUM SHA256_E-MAIL 17" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE17.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE17.txt ;
##for d12 in XXX.eml
##do sha256sum "$d12" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE17.txt ;
##echo "CHECKSUM MD5_E-MAIL17" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE17.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE17.txt;
##md5sum "$d11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE17.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE17.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email18()
##{
##echo "CHECKSUM SHA256_E-MAIL 18" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE18.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE18.txt ;
##for d12 in XXX.eml
##do sha256sum "$d12" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE18.txt ;
##echo "CHECKSUM MD5_E-MAIL18" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE18.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE18.txt;
##md5sum "$d12" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE18.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE18.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email19()
##{
##echo "CHECKSUM SHA256_E-MAIL 19" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE19.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE19.txt ;
##for d13 in XXX.eml
##do sha256sum "$d13" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE19.txt ;
##echo "CHECKSUM MD5_E-MAIL19" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE19.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE19.txt;
##md5sum "$d13" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE19.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE19.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_email20()
##{
##echo "CHECKSUM SHA256_E-MAIL 20" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE20.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE20.txt ;
##for d14 in XXX.eml
##do sha256sum "$d14" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE20.txt ;
##echo "CHECKSUM MD5_E-MAIL20" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE20.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE20.txt;
##md5sum "$d14" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE20.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_E-MAIL_ORIGINALE20.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##########################################################################################################################################################################
# 						                                           			             						#
#  CREAZIONE DEL CHECKSUM SHA256 E MD5 DELLE COPIE DELLE E-MAIL. SERVE PER DIMOSTRARE LA COERENZA TRA L'ORIGINALE E LA COPIA, CIOÈ CHE I DATI NON SONO STATI ALTERATI   #
#																					#
# VIENE CREATO UN REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA              				#
##########################################################################################################################################################################

checksum_copia_email1()
{
echo "CHECKSUM SHA256_COPIA_E-MAIL 1" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL1.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL1.txt ;
for a10 in /path/Reperti/Copie_email/1.eml;
do
sha256sum "$a10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL1.txt ; 
echo "CHECKSUM MD5_COPIA_E-MAIL1" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL1.txt 
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL1.txt;
md5sum "$a10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL1.txt ;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL1.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
done ;
}

checksum_copia_email2()
{
echo "CHECKSUM SHA256_COPIA_E-MAIL 2" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL2.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL2.txt;
for a11 in /path/Reperti/Copie_email/2.eml
do sha256sum "$a11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL2.txt ;
echo "CHECKSUM MD5_COPIA_E-MAIL2" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL2.txt
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL2.txt;
md5sum "$a11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL2.txt
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL2.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt
done;
}
checksum_copia_email3()
{
echo "CHECKSUM SHA256_COPIA_E-MAIL 3" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL3.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL3.txt ;
for c10 in /path/Reperti/Copie_email/3.eml
do sha256sum "$c10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL3.txt ;
echo "CHECKSUM MD5_COPIA_E-MAIL3" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL3.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL3.txt;
md5sum "$c10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL3.txt;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL3.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
done;
}

checksum_copia_email4()
{
echo "CHECKSUM SHA256_COPIA_E-MAIL 4" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL4.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL4.txt ;
for d20 in /path/Reperti/Copie_email/4.eml
do sha256sum "$d20" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL4.txt ;
echo "CHECKSUM MD5_COPIA_E-MAIL4" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL4.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL4.txt;
md5sum "$d20" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL4.txt;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL4.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
done;
}

##checksum_copia_email5()#####################DECOMMENTARE SE SONO 20 E-MAIL, SE SONO MOLTO DI PIÙ FARE UN COPIA INCOLLA E MODIFICARE LE RIGHE .
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 5" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL5.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL5.txt ;
##for d21 in xxx.eml
##do sha256sum "$d21" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL5.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL5" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL5.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL5.txt;
##md5sum "$d21" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL5.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL5.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_copia_email6()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 6" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL6.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL6.txt ;
##for d22 in xxx.eml
##do sha256sum "$d22" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL6.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL6" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL6.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL6.txt;
##md5sum "$d22" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL6.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL6.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_copia_email7()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 7" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL7.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL7.txt ;
##for d23 in xxx.eml
##do sha256sum "$d23" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL7.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL7" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL7.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL7.txt;
##md5sum "$d23" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL7.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL7.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_copia_email8()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL8.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL8.txt ;
##for d24 in xxx.eml
##do sha256sum "$d24" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL8.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL8.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL8.txt;
##md5sum "$d24" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL8.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL8.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}
##checksum_copia_email9()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 9" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL9.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL9.txt ;
##for d25 in xxx.eml
##do sha256sum "$d25" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL9.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL9" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL9.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL9.txt;
##md5sum "$d25" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL9.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL9.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_copia_email10()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL10.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL10.txt ;
##for d26 in xxx.eml
##do sha256sum "$d26" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL10.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL10.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL10.txt;
##md5sum "$d26" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL10.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL10.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_copia_email11()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL11.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL11.txt ;
##for d27 in XXX.eml
##do sha256sum "$d27" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL11.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL11.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL11.txt;
##md5sum "$d27" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL11.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL11.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_copia_email12()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 12" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL12.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL12.txt ;
##for d28 in XXX.eml
##do sha256sum "$d28" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL12.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL12" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL12.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL12.txt;
##md5sum "$d28" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL12.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL12.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_copia_email13()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 13" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL13.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL13.txt ;
##for d29 in XXX.eml
##do sha256sum "$d29" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL13.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL13" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL13.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL13.txt;
##md5sum "$d8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL13.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL13.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_copia_email14()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 14" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL14.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL14.txt ;
##for d30 in XXX.eml
##do sha256sum "$d30" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL14.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL14" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL14.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL14.txt;
##md5sum "$d30" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL14.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL14.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_copia_email15()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 15" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL15.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL15.txt ;
##for d31 in XXX.eml
##do sha256sum "$d31" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL15.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL15" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL15.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL15.txt;
##md5sum "$d31" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL15.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL15.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}
##checksum_copia_email16()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 16" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL16.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL16.txt ;
##for d32 in XXX.eml
##do sha256sum "$d32" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL16.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL16" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL16.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL16.txt;
##md5sum "$d32" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL16.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL16.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}
##checksum_copia_email17()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 17" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL17.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL17.txt ;
##for d33 in XXX.eml
##do sha256sum "$d33" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL17.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL17" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL17.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL17.txt;
##md5sum "$d34" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL17.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL17.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_copia_email18()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 18" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL18.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL18.txt ;
##for d34 in XXX.eml
##do sha256sum "$d34" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL18.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL18" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL18.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL18.txt;
##md5sum "$d34" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL18.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL18.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_copia_email19()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 19" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL19.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL19.txt ;
##for d35 in XXX.eml
##do sha256sum "$d35" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL19.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL19" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL19.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL19.txt;
##md5sum "$d36" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL19.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL19.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}

##checksum_copia_email20()
##{
##echo "CHECKSUM SHA256_COPIA_E-MAIL 20" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL20.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL20.txt ;
##for d36 in XXX.eml
##do sha256sum "$d36" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL20.txt ;
##echo "CHECKSUM MD5_COPIA_E-MAIL20" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL20.txt;
##date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL20.txt;
##md5sum "$d36" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL20.txt;
##cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_COPIA_E-MAIL20.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
##done;
##}



################################################################################################################################################################
# ESTRAZIONE HEADERS DALLA COPIA E-MAIL 1                                                                                                                                  #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È STATA INVIATA L'E-MAIL E CON QUALE IP                                                      #
#                                                                                                                                                              #
#  VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           #
###############################################################################################################################################################

estrazione_headers_copia_email1()

{
echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL1" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_1.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_1.txt ;
grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/1.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_1.txt 
cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_1.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                  #
#                                                                                                                                                              #
#  VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           #
#################################################################################################################################################################
checksum_estrazione_headers_copia_email1()
{
echo "CHECKSUM SHA256 ESTRARAZIONE INFORMAZIONI HEADERS E-MAIL 1" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_1.txt ;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_1.txt ;
for e in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_1.txt;
do 
sha256sum "$e" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_1.txt;
done;
echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 1" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_1.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_1.txt;
md5sum "$e" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_1.txt ;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_1.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 1 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           #
###############################################################################################################################################################

estrazione_ip_headers_copia_email1()
{
grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_1.txt >> /path/Reperti/Estrazioni/Reperti_IP1.txt ;
cat /path/Reperti/Estrazioni/Reperti_IP1.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP1 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #                                                                                               
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
#																			     #
##############################################################################################################################################################

checksum_copia_repertiIP1()
{
echo "CHECKSUM SHA256 Reperti_IP1" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP1.txt ;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP1.txt ;
for f in /path/Reperti/Estrazioni/Reperti_IP1.txt;
do
sha256sum "$f" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP1.txt;
done;
echo "CHECKSUM MD5 Reperti_IP1" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP1.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP1.txt;
md5sum "$f" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP1.txt ;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP1.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;

}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 2                                                                                                                                  #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

estrazione_headers_copia_email2()
{
echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL1" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email2.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email2.txt ;
grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/2.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email2.txt
cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email2.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 2 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

checksum_estrazione_headers_copia_email2()
{
echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 2" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL2.txt ;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL2.txt ;
for g in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email2.txt;
do
sha256sum "$g" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL2.txt;
done;
echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 2" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL2.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL2.txt;
md5sum "$g" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL2.txt ;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL2.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;

}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 1 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


estrazione_ip_headers_copia_email2()
{
grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email2.txt >> /path/Reperti/Estrazioni/Reperti_IP2.txt ;
cat /path/Reperti/Estrazioni/Reperti_IP2.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;

}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP2 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
checksum_copia_repertiIP2()
{
echo "CHECKSUM SHA256 Reperti_IP2" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP2.txt ;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP2.txt ;
for h in /path/Reperti/Estrazioni/Reperti_IP2.txt;
do
sha256sum "$h" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP2.txt;
done;
echo "CHECKSUM MD5 Reperti_IP2" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP2.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP2.txt;
md5sum "$h" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP2.txt ;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP2.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 3                                                                                                                                  #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

estrazione_headers_copia_email3()
{
echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL3" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_3.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_3.txt ;
grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/3.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_3.txt
cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_3.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
}

################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 3 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
#################################################################################################################################################################


checksum_estrazione_headers_copia_email3()
{
echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 3" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_3.txt ;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_3.txt ;
for i in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_3.txt;
do
sha256sum "$i" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_3.txt;
done;
echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 3" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_3.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_3.txt;
md5sum "$i" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_3.txt ;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_3.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 3 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           #
###############################################################################################################################################################

estrazione_ip_headers_copia_email3()
{
grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_3.txt >> /path/Reperti/Estrazioni/Reperti_IP3.txt ;
cat /path/Reperti/Estrazioni/Reperti_IP3.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP3 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

checksum_copia_repertiIP3()
{
echo "CHECKSUM SHA256 Reperti_IP3" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP_3.txt ;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP_3.txt ;
for l in /path/Reperti/Estrazioni/Reperti_IP3.txt;
do
sha256sum "$l" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP_3.txt;
done;
echo "CHECKSUM MD5 Reperti_IP3" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP_3.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP_3.txt;
md5sum "$l" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP_3.txt ;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP_3.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 4                                                                                                                                  #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

estrazione_headers_copia_email4()
{
echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL4" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_4.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_4.txt ;
grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/4.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_4.txt
cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_4.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
}

################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 4 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
#################################################################################################################################################################

checksum_estrazione_headers_copia_email4()
{
echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 4" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_4.txt ;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_4.txt ;
for m in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_4.txt;
do
sha256sum "$m" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_4.txt;
done;
echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 4" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_4.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_4.txt;
md5sum "$m" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_4.txt ;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL_4.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 4 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

estrazione_ip_headers_copia_email4()
{
grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_3.txt >> /path/Reperti/Estrazioni/Reperti_IP4.txt ;
cat /path/Reperti/Estrazioni/Reperti_IP4.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
}

##############################################################################################################################################################
#    CREAZIONE DEL CHECKSUM SHA256 E MD5 DELLE COPIE ORIGINALI, IL CHECKSUM SERVE PER DIMOSTRARE LA COERENZA TRA L'ORIGINALE E LA COPIA	                     #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
checksum_copia_repertiIP4()
{
echo "CHECKSUM SHA256 Reperti_IP4" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP4.txt ;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP4.txt ;
for n in /path/Reperti/Estrazioni/Reperti_IP4.txt;
do
sha256sum "$n" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP4.txt;
done;
echo "CHECKSUM MD5 Reperti_IP4" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP4.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP4.txt;
md5sum "$n" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP4.txt ;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_IP4.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 5                                                                                                                                #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#################DECOMMENTARE 
#estrazione_headers_copia_email5()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL5" >> /path//Reperti/Reperti_Estrazione_Headers_Email_5.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path//Reperti/Reperti_Estrazione_Headers_Email_5.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path//Reperti/Reperti_Estrazione_Headers_Email_5.txt
#cat /path//Reperti/Reperti_Estrazione_Headers_Email_5.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 5 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email5()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 5" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL5.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL5.txt ;
#for g11 in /path//Reperti/Reperti_Estrazione_Headers_Email_5.txt;
#do
#sha256sum "$g11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL5.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 5" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL5.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL5.txt;
#md5sum "$g11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL5.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL5.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 5 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################

#estrazione_ip_headers_copia_email5()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path//Reperti/Reperti_Estrazione_Headers_Email_5.txt >> /path/Reperti/Estrazioni/Reperti_IP5.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP5.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP5 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP5()
#{
#echo "CHECKSUM SHA256 Reperti_IP5" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt ;
#for g12 in /path/Reperti/Estrazioni/Reperti_IP5.txt;
#do
#sha256sum "$g12" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP5" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt;
#md5sum "$g12" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 6                                                                                                                                #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email6()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL6" >> /path//Reperti/Reperti_Estrazione_Headers_Email_6.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path//Reperti/Reperti_Estrazione_Headers_Email_6.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path//Reperti/Reperti_Estrazione_Headers_Email_6.txt
#cat /path//Reperti/Reperti_Estrazione_Headers_Email_6.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 6 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email6()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 6" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL6.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL6.txt ;
#for g13 in /path//Reperti/Reperti_Estrazione_Headers_Email_6.txt;
#do
#sha256sum "$g13" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL6.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 6" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL6.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL6.txt;
#md5sum "$g13" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL6.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL6.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 6 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email6()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path//Reperti/Reperti_Estrazione_Headers_Email_6.txt >> /path/Reperti/Estrazioni/Reperti_IP6.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP6.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP6 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP6()
#{
#echo "CHECKSUM SHA256 Reperti_IP6" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP6.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP6.txt ;
#for g14 in /path/Reperti/Estrazioni/Reperti_IP6.txt;
#do
#sha256sum "$g14" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP6.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP6" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP6.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP6.txt;
#md5sum "$g14" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP6.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP6.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 7                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email7()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL7" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_7.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_7.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_7.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_7.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 7 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email7()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 6" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL7.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL7.txt ;
#for g15 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_7.txt;
#do
#sha256sum "$g15" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL7.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 6" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL7.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL7.txt;
#md5sum "$g15" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL7.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL7.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 7 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email7()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_7.txt >> /path/Reperti/Estrazioni/Reperti_IP7.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP7.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP7 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP7()
#{
#echo "CHECKSUM SHA256 Reperti_IP7" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt ;
#for g16 in /path/Reperti/Estrazioni/Reperti_IP7.txt;
#do
#sha256sum "$g16" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP7" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt;
#md5sum "$g16" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP7.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}


################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 8                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email8()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL8" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_8.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_8.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_8.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_8.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 8 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email8()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL8.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL8.txt ;
#for g17 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_8.txt;
#do
#sha256sum "$g17" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL8.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL8.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL8.txt;
#md5sum "$g17" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL8.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL8.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 8 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email8()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_8.txt >> /path/Reperti/Estrazioni/Reperti_IP8.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP8.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP7 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP8()
#{
#echo "CHECKSUM SHA256 Reperti_IP7" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP8.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP8.txt ;
#for g18 in /path/Reperti/Estrazioni/Reperti_IP8.txt;
#do
#sha256sum "$g18" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP8.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP7" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP8.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP8.txt;
#md5sum "$g18" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP8.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP8.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 9                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email9()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL9" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_9.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_9.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_9.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_9.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 9 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email9()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL9.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL9.txt ;
#for g19 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_9.txt;
#do
#sha256sum "$g19" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL9.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL9.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL9.txt;
#md5sum "$g19" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL9.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL9.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 9 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email9()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_9.txt >> /path/Reperti/Estrazioni/Reperti_IP9.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP9.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP9 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP9()
#{
#echo "CHECKSUM SHA256 Reperti_IP9" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP9.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP9.txt ;
#for g20 in /path/Reperti/Estrazioni/Reperti_IP9.txt;
#do
#sha256sum "$g20" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP9.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP9" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP9.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP9.txt;
#md5sum "$g20" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP9.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP9.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 10                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email10()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL10" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_10.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_10.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_10.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_10.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 10 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email10()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL10.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL10.txt ;
#for g21 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_10.txt;
#do
#sha256sum "$g21" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL10.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL10.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL10.txt;
#md5sum "$g22" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL10.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL10.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 10 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email10()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_10.txt >> /path/Reperti/Estrazioni/Reperti_IP10.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP10.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP10 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP10()
#{
#echo "CHECKSUM SHA256 Reperti_IP10" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP10.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP10.txt ;
#for g23 in /path/Reperti/Estrazioni/Reperti_IP10.txt;
#do
#sha256sum "$g23" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP10.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP9" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP10.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP10.txt;
#md5sum "$g23" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP10.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP10.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 11                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email11()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL11" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_11.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_11.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_11.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_11.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 10 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email11()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL11txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL11txt ;
#for g24 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_11.txt;
#do
#sha256sum "$g24" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL11txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL11txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL11txt;
#md5sum "$g24" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL11txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL11txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 11 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email11()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_11.txt >> /path/Reperti/Estrazioni/Reperti_IP11.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP11.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP111 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP11()
#{
#echo "CHECKSUM SHA256 Reperti_IP11" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP11.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP11.txt ;
#for g25 in /path/Reperti/Estrazioni/Reperti_IP11.txt;
#do
#sha256sum "$g25" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP11.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP11" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP11.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP11.txt;
#md5sum "$g26" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP11.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP11.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 12                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email12()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL12" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_12.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_12.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_12.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_12.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 12 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email12()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 12" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL12.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL12.txt ;
#for g24 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_12.txt;
#do
#sha256sum "$g24" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL12.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 12" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL12.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL12.txt;
#md5sum "$g24" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL12.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL12.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 12 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email12()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_12.txt >> /path/Reperti/Estrazioni/Reperti_IP12.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP12.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP12 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP12()
#{
#echo "CHECKSUM SHA256 Reperti_IP12" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP12.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP12.txt ;
#for g25 in /path/Reperti/Estrazioni/Reperti_IP12.txt;
#do
#sha256sum "$g25" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP12.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP12" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP12.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP12.txt;
#md5sum "$g25" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP12.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP12.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 13                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email13()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL13" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_13.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_13.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_13.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_13.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 13 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email13()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 13" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL13.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL13.txt ;
#for g26 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_13.txt;
#do
#sha256sum "$g26" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL13.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 13" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL13.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL13.txt;
#md5sum "$g26" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL13.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL13.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 13 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email13()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_13.txt >> /path/Reperti/Estrazioni/Reperti_IP13.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP13.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP13 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP13()
#{
#echo "CHECKSUM SHA256 Reperti_IP13" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP13.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP13.txt ;
#for g27 in /path/Reperti/Estrazioni/Reperti_IP13.txt;
#do
#sha256sum "$g27" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP13.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP13" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP13.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP13.txt;
#md5sum "$g27" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP13.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP13.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 14                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email14()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL14" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_14.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_14.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_14.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_14.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 14 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email14()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 14" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL14.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL14.txt ;
#for g28 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_14.txt;
#do
#sha256sum "$g28" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL14.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 14" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL14.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL14.txt;
#md5sum "$g28" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL14.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL14.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 14 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email14()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_14.txt >> /path/Reperti/Estrazioni/Reperti_IP14.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP14.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP14 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP14()
#{
#echo "CHECKSUM SHA256 Reperti_IP14" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP14.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP14.txt ;
#for g29 in /path/Reperti/Estrazioni/Reperti_IP14.txt;
#do
#sha256sum "$g27" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP14.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP14" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP14.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP14.txt;
#md5sum "$g29" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP14.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP14.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 15                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email15()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL15" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_15.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_15.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_15.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_15.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 15 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email15()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 15" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL15.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL15.txt ;
#for g30 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_15.txt;
#do
#sha256sum "$g30" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL15.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 15" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL15.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL15.txt;
#md5sum "$g30" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL15.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL15.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 15 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email15()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_15.txt >> /path/Reperti/Estrazioni/Reperti_IP15.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP15.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP15 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP15()
#{
#echo "CHECKSUM SHA256 Reperti_IP15" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP15.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP15.txt ;
#for g31 in /path/Reperti/Estrazioni/Reperti_IP15.txt;
#do
#sha256sum "$g31" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP15.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP15" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP15.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP15.txt;
#md5sum "$g31" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP15.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP15.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 16                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email16()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL16" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_16.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_16.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_16.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_16.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 16 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email16()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 16" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL16.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL16.txt ;
#for g32 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_16.txt;
#do
#sha256sum "$g32" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL16.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 16" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL16.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL16.txt;
#md5sum "$g32" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL16.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL16.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 16 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email16()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_16.txt >> /path/Reperti/Estrazioni/Reperti_IP16.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP16.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP16 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP16()
#{
#echo "CHECKSUM SHA256 Reperti_IP16" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP16.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP16.txt ;
#for g33 in /path/Reperti/Estrazioni/Reperti_IP16.txt;
#do
#sha256sum "$g33" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP16.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP16" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP16.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP16.txt;
#md5sum "$gg33" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP16.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP16.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 17                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email17()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL17" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_17.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_17.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_17.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_17.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 17 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email17()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 17" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL17.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL17.txt ;
#for g34 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_17.txt;
#do
#sha256sum "$g35" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL17.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 17" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL17.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL17.txt;
#md5sum "$g35" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL17.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL17.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 17 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email17()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_17.txt >> /path/Reperti/Estrazioni/Reperti_IP17.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP17.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP17 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP17()
#{
#echo "CHECKSUM SHA256 Reperti_IP17" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP17.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP17.txt ;
#for g36 in /path/Reperti/Estrazioni/Reperti_IP17.txt;
#do
#sha256sum "$g36" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP17.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP17" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP17.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP17.txt;
#md5sum "$g36" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP17.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP17.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 18                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email18()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL18" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_18.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_18.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_18.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_18.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 18 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email18()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 18" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL18.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL18.txt ;
#for g37 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_18.txt;
#do
#sha256sum "$g37" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL18.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 18" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL18.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL18.txt;
#md5sum "$g37" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL18.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL18.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 18 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email18()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_18.txt >> /path/Reperti/Estrazioni/Reperti_IP18.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP18.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP18 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP18()
#{
#echo "CHECKSUM SHA256 Reperti_IP18" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP18.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP18.txt ;
#for g38 in /path/Reperti/Estrazioni/Reperti_IP18.txt;
#do
#sha256sum "$g38" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP18.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP18" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP18.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP18.txt;
#md5sum "$g38" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP18.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP18.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 19                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email19()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL19" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_19.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_19.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_19.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_19.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 19 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email19()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 19" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL19.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL19.txt ;
#for g39 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_19.txt;
#do
#sha256sum "$g39" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL19.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 19" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL19.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL19.txt;
#md5sum "$g39" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL19.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL19.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 19 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email19()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_19.txt >> /path/Reperti/Estrazioni/Reperti_IP19.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP19.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP19 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP19()
#{
#echo "CHECKSUM SHA256 Reperti_IP19" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP19.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP19.txt ;
#for g40 in /path/Reperti/Estrazioni/Reperti_IP19.txt;
#do
#sha256sum "$g40" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP19.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP19" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP19.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP19.txt;
#md5sum "$g40" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP19.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP19.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}

################################################################################################################################################################
# ESTRAZIONE HEADERS E-MAIL 20                                                                                                                               #
# LA PROCEDURA DI ESTRAZIONE SERVE PER ESTRAPOLARE DALLE E-MAIL I FRAME DELL'HEADERS "DATE, FROM, TO, SUBJECT, USER AGENT, RECEVIVED, X-MAILER, X-SOURCE-IP"   #
# QUESTE INFORMAZIONI SERVONO PER IDENTIFICARE IL COMPUTER DA CUI È‰ STATA INVIATA L'E-MAIL E CON QUALE IP                                                     #
#                                                                                                                                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                            #
###############################################################################################################################################################

#estrazione_headers_copia_email20()
#{
#echo "ESTRAZIONE INFORMAZIONI HEADERS E-MAIL20" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_20.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_20.txt ;
#grep -a -E -i "^Date: |^From: |^To: |^Subject: |^User Agent:|^Received: |^X-Mailer: |^X-Source-IP:" /path/Reperti/Copie_email/xxxx.eml >> /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_20.txt
#cat /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_20.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}


################################################################################################################################################################
# IL CHECKUM ESTRAZIONE  HEADER DELL'E-MAIL 20 VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                                #
#                                                                                                                                                              #
#VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                             #
#################################################################################################################################################################

#checksum_estrazione_headers_copia_email20()
#{
#echo "CHECKSUM SHA256 ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 20" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL20.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL20.txt ;
#for g41 in /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_20.txt;
#do
#sha256sum "$g41" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL20.txt;
#done;
#echo "CHECKSUM MD5_ESTRAZIONE INFORMAZIONI HEADERS E-MAIL 20" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL20.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL20.txt;
#md5sum "$g41" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL20.txt ;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_REPERTI_ESTRAZIONE_HEADERS_E-MAIL20.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

###############################################################################################################################################################
# L'ESTRAZIONE DELL'IP DALL'HEADERS DELL'E-MAIL 20 SERVE PER PROCEDERE ALL'IDENTIFICAZIONE DEL PROVIDER DA CUI È STATA SPEDITA L'E'-MAIL                       #
#                                                                                                                                                             #
#                                                                                                                                                             #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                           # 
###############################################################################################################################################################


#estrazione_ip_headers_copia_email20()
#{
#grep -o '[0-9]\{1,3\}\(\.[0-9]\{1,3\}\)\{3\}' /path/Reperti/Estrazioni/Reperti_Estrazione_Headers_Email_20.txt >> /path/Reperti/Estrazioni/Reperti_IP20.txt ;
#cat /path/Reperti/Estrazioni/Reperti_IP20.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "REPERTIIP20 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE REPERTATA                                              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
#checksum_copia_repertiIP20()
#{
#echo "CHECKSUM SHA256 Reperti_IP20" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP20.txt ;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP20.txt ;
#for g42 in /path/Reperti/Estrazioni/Reperti_IP20.txt;
#do
#sha256sum "$g42" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP20.txt;
#done;
#echo "CHECKSUM MD5 Reperti_IP20" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP20.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP20.txt;
#md5sum "$g42" >> /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP20.txt ;
#cat /path/Reperti/path/Reperti/Log/Log_Hash_SHA256_MD5_Reperti_IP20.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#}


#######################################################################################################################################################################
#    IL WHOIS DEL REPERTO LOG "REPERTI_IP1 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE #         
#                     																	              #
#   VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                 #
#######################################################################################################################################################################

whois_ip_Reperti_IP1()
{
echo "WHOIS Reperti_IP1" >> /path/Reperti/Estrazioni/Whois_Reperti_IP1.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP1.txt;
for o in `cat /path/Reperti/Estrazioni/Reperti_IP1.txt`;  
do  
whois  $o  >> /path/Reperti/Estrazioni/Whois_Reperti_IP1.txt;  
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP1.txt;
geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $o >> /path/Reperti/Estrazioni/Whois_Reperti_IP1.txt; 
cat /path/Reperti/Estrazioni/Whois_Reperti_IP1.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP1 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################
checksum_whois_Reperti_IP1()
{
echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP1" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP1.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP1.txt;
for p in /path/Reperti/Estrazioni/Reperti_IP1.txt;
do sha256sum "$p" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP1.txt;
echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP1" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP1.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP1.txt;
md5sum "$p" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP1.txt;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP1.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}

#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP2 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

whois_ip_Reperti_IP2()
{
echo "WHOIS Reperti_IP1" >> /path/Reperti/Estrazioni/Whois_Reperti_IP2.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP2.txt;
for q in `cat /path/Reperti/Estrazioni/Reperti_IP2.txt`;  
do  
whois  $q  >> /path/Reperti/Estrazioni/Whois_Reperti_IP2.txt;  
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP2.txt;
geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $q >> /path/Reperti/Estrazioni/Whois_Reperti_IP2.txt; 
cat /path/Reperti/Estrazioni/Whois_Reperti_IP2.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;

}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP2 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                # 
#                     																	     #
#     VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                      #
##############################################################################################################################################################

checksum_whois_Reperti_IP2()
{
echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP2" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP2.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP2.txt;
for r in /path/Reperti/Estrazioni/Reperti_IP2.txt;
do sha256sum "$r" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP2.txt;
echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP2" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP2.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP2.txt;
md5sum "$r" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP2.txt;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP2.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}

#######################################################################################################################################################################
#  IL WHOIS DEL REPERTO LOG "REPERTI_IP3 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE   #        
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

whois_ip_Reperti_IP3()
{
echo "WHOIS Reperti_IP3" >> /path/Reperti/Estrazioni/Whois_Reperti_IP3.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP3.txt;
for s in `cat /path/Reperti/Estrazioni/Reperti_IP3.txt`;  
do  
whois  $s  >> /path/Reperti/Estrazioni/Whois_Reperti_IP3.txt;  
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP3.txt;
geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $s >> /path/Reperti/Estrazioni/Whois_Reperti_IP3.txt; 
cat /path/Reperti/Estrazioni/Whois_Reperti_IP3.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}


##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP3 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

checksum_whois_Reperti_IP3()
{
echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP1" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP3.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP3.txt;
for t in /path/Reperti/Estrazioni/Reperti_IP3.txt;
do sha256sum "$t" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP3.txt;
echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP1" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP3.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP3.txt;
md5sum "$t" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP3.txt;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP3.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}


#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP4 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

whois_ip_Reperti_IP4()
{
echo "WHOIS Reperti_IP4" >> /path/Reperti/Estrazioni/Whois_Reperti_IP4.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP4.txt;
for u in `cat /path/Reperti/Estrazioni/Reperti_IP4.txt`;  
do  
whois  $u  >> /path/Reperti/Estrazioni/Whois_Reperti_IP4.txt;  
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP4.txt;
geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u >> /path/Reperti/Estrazioni/Whois_Reperti_IP4.txt; 
cat /path/Reperti/Estrazioni/Whois_Reperti_IP4.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;

}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP4 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

checksum_whois_Reperti_IP4()
{
echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP4" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP4.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP1.txt;
for v in /path/Reperti/Estrazioni/Reperti_IP4.txt;
do sha256sum "$v" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP4.txt;
echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP4" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP4.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP4.txt;
md5sum "$v" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP4.txt;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP4.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}

#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP5 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP5()
# {
# echo "WHOIS Reperti_IP5" >> /path/Reperti/Estrazioni/Whois_Reperti_IP5.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP5.txt;
# for u1 in `cat /path/Reperti/Estrazioni/Reperti_IP5.txt`;  
# do  
# whois  $u1  >> /path/Reperti/Estrazioni/Whois_Reperti_IP5.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP5.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u1 >> /path/Reperti/Estrazioni/Whois_Reperti_IP5.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP5.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP5 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP5()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP5" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP5.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP1.txt;
# for u2 in /path/Reperti/Estrazioni/Reperti_IP5.txt;
# do sha256sum "$u2" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP5.txt;
# echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP5" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP5.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP5.txt;
# md5sum "$u2" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP5.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP5.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP6 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP6()
# {
# echo "WHOIS Reperti_IP6" >> /path/Reperti/Estrazioni/Whois_Reperti_IP6.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP6.txt;
# for u3 in `cat /path/Reperti/Estrazioni/Reperti_IP6.txt`;  
# do  
# whois  $u1  >> /path/Reperti/Estrazioni/Whois_Reperti_IP6.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP6.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u3 >> /path/Reperti/Estrazioni/Whois_Reperti_IP6.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP6.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP6 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP6()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP6" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP6.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log_Hash_SHA266_MD6_Whois_Reperti_IP6.txt;
# for u4 in /path/Reperti/Estrazioni/Reperti_IP6.txt;
# do sha256sum "$u4" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP6.txt;
# echo "CHECKSUM MD6_Log_Hash_SHA256_MD6_Whois_Reperti_IP6" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP6.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP6.txt;
# md5sum "$u4" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP6.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP6.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP7 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP7()
# {
# echo "WHOIS Reperti_IP7" >> /path/Reperti/Estrazioni/Whois_Reperti_IP7.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP7.txt;
# for u3 in `cat /path/Reperti/Estrazioni/Reperti_IP7.txt`;  
# do  
# whois  $u3  >> /path/Reperti/Estrazioni/Whois_Reperti_IP7.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP7.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u3 >> /path/Reperti/Estrazioni/Whois_Reperti_IP7.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP7.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP7 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP7()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP7" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP7.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP7.txt;
# for u4 in /path/Reperti/Estrazioni/Reperti_IP7.txt;
# do sha256sum "$u4" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP7.txt;
# echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP7" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP7.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP7.txt;
# md5sum "$u4" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP7.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP7.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }


#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP8 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP8()
# {
# echo "WHOIS Reperti_IP8" >> /path/Reperti/Estrazioni/Whois_Reperti_IP8.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP8.txt;
# for u5 in `cat /path/Reperti/Estrazioni/Reperti_IP8.txt`;  
# do  
# whois  $u5 >> /path/Reperti/Estrazioni/Whois_Reperti_IP8.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP8.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u5 >> /path/Reperti/Estrazioni/Whois_Reperti_IP8.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP8.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP8 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP8()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP8.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP8.txt;
# for u6 in /path/Reperti/Estrazioni/Reperti_IP8.txt;
# do sha256sum "$u6" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP8.txt;
# echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP8" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP8.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP8.txt;
# md5sum "$u6" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP8.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP8.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP9 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP9()
# {
# echo "WHOIS Reperti_IP9" >> /path/Reperti/Estrazioni/Whois_Reperti_IP9.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP9.txt;
# for u7 in `cat /path/Reperti/Estrazioni/Reperti_IP9.txt`;  
# do  
# whois  $u7 >> /path/Reperti/Estrazioni/Whois_Reperti_IP9.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP9.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u7 >> /path/Reperti/Estrazioni/Whois_Reperti_IP9.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP9.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP9 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP9()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP9" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP9.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP9.txt;
# for u8 in /path/Reperti/Estrazioni/Reperti_IP9.txt;
# do sha256sum "$u8" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP9.txt;
# echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP9" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP9.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP9.txt;
# md5sum "$u8" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP9.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP9.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP10 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP10()
# {
# echo "WHOIS Reperti_IP10" >> /path/Reperti/Estrazioni/Whois_Reperti_IP10.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP10.txt;
# for u9 in `cat /path/Reperti/Estrazioni/Reperti_IP10.txt`;  
# do  
# whois  $u9 >> /path/Reperti/Estrazioni/Whois_Reperti_IP10.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP10.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u9 >> /path/Reperti/Estrazioni/Whois_Reperti_IP10.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP10.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP10 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP10()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP10.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP10.txt;
# for u10 in /path/Reperti/Estrazioni/Reperti_IP10.txt;
# do sha256sum "$u10" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP10.txt;
# echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP10" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP10.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP10.txt;
# md5sum "$u10" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP10.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP10.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP11 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP11()
# {
# echo "WHOIS Reperti_IP11" >> /path/Reperti/Estrazioni/Whois_Reperti_IP11.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP11.txt;
# for u11 in `cat /path/Reperti/Estrazioni/Reperti_IP11.txt`;  
# do  
# whois  $u11 >> /path/Reperti/Estrazioni/Whois_Reperti_IP11.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP11.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u11 >> /path/Reperti/Estrazioni/Whois_Reperti_IP11.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP11.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP11 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP11()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP11.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP11.txt;
# for u13 in /path/Reperti/Estrazioni/Reperti_IP11.txt;
# do sha256sum "$u13" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP11.txt;
# echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP11" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP11.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP11.txt;
# md5sum "$u13" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP11.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP11.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP14 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP14()
# {
# echo "WHOIS Reperti_IP14" >> /path/Reperti/Estrazioni/Whois_Reperti_IP14.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP14.txt;
# for u14 in `cat /path/Reperti/Estrazioni/Reperti_IP14.txt`;  
# do  
# whois  $u14 >> /path/Reperti/Estrazioni/Whois_Reperti_IP14.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP14.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u14 >> /path/Reperti/Estrazioni/Whois_Reperti_IP14.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP14.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP14 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP14()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP14" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP14.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP14.txt;
# for u15 in /path/Reperti/Estrazioni/Reperti_IP14.txt;
# do sha256sum "$u15" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP14.txt;
# echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP14" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP14.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP14.txt;
# md5sum "$u15" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP14.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP14.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP15 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP15()
# {
# echo "WHOIS Reperti_IP15" >> /path/Reperti/Estrazioni/Whois_Reperti_IP15.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP15.txt;
# for u15 in `cat /path/Reperti/Estrazioni/Reperti_IP15.txt`;  
# do  
# whois  $u15 >> /path/Reperti/Estrazioni/Whois_Reperti_IP15.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP15.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u15 >> /path/Reperti/Estrazioni/Whois_Reperti_IP15.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP15.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP15 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP15()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP15" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP15.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP15.txt;
# for u16 in /path/Reperti/Estrazioni/Reperti_IP15.txt;
# do sha256sum "$u16" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP15.txt;
# echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP15" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP15.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP15.txt;
# md5sum "$u16" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP15.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP15.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP16 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP16()
# {
# echo "WHOIS Reperti_IP16" >> /path/Reperti/Estrazioni/Whois_Reperti_IP16.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP16.txt;
# for u17 in `cat /path/Reperti/Estrazioni/Reperti_IP16.txt`;  
# do  
# whois  $u17 >> /path/Reperti/Estrazioni/Whois_Reperti_IP16.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP16.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u17 >> /path/Reperti/Estrazioni/Whois_Reperti_IP16.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP16.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP16 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP16()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP16" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP16.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP16.txt;
# for u18 in /path/Reperti/Estrazioni/Reperti_IP16.txt;
# do sha256sum "$u18" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP16.txt;
# echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP16" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP16.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP16.txt;
# md5sum "$u18" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP16.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP16.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP17 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP17()
# {
# echo "WHOIS Reperti_IP17" >> /path/Reperti/Estrazioni/Whois_Reperti_IP17.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP17.txt;
# for u19 in `cat /path/Reperti/Estrazioni/Reperti_IP17.txt`;  
# do  
# whois  $u19 >> /path/Reperti/Estrazioni/Whois_Reperti_IP17.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP17.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u19 >> /path/Reperti/Estrazioni/Whois_Reperti_IP17.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP17.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP17 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP17()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP17" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP17.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP17.txt;
# for u20 in /path/Reperti/Estrazioni/Reperti_IP17.txt;
# do sha256sum "$u20" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP17.txt;
# echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP17" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP17.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP17.txt;
# md5sum "$u20" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP17.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP17.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP18 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP18()
# {
# echo "WHOIS Reperti_IP18" >> /path/Reperti/Estrazioni/Whois_Reperti_IP18.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP18.txt;
# for u21 in `cat /path/Reperti/Estrazioni/Reperti_IP18.txt`;  
# do  
# whois  $u21 >> /path/Reperti/Estrazioni/Whois_Reperti_IP18.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP18.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u21 >> /path/Reperti/Estrazioni/Whois_Reperti_IP18.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP18.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP18 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP18()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP18" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP18.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP18.txt;
# for u22 in /path/Reperti/Estrazioni/Reperti_IP18.txt;
# do sha256sum "$u22" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP18.txt;
# echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP18" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP18.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP18.txt;
# md5sum "$u22" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP18.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP18.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }
#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP19 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP19()
# {
# echo "WHOIS Reperti_IP19" >> /path/Reperti/Estrazioni/Whois_Reperti_IP19.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP19.txt;
# for u23 in `cat /path/Reperti/Estrazioni/Reperti_IP19.txt`;  
# do  
# whois  $u23 >> /path/Reperti/Estrazioni/Whois_Reperti_IP19.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP19.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u23 >> /path/Reperti/Estrazioni/Whois_Reperti_IP19.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP19.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP19 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP19()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP19" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP19.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP19.txt;
# for u24 in /path/Reperti/Estrazioni/Reperti_IP19.txt;
# do sha256sum "$u24" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP19.txt;
# echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP19" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP19.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP19.txt;
# md5sum "$u24" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP19.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP19.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

#######################################################################################################################################################################
#     IL WHOIS DEL REPERTO LOG "REPERTI_IP20 ", SCRIVE NEL LOG WHOIS_REPERTI_IP1, IL PROVIDER DA CUI È STATA INVIATA L'E-MAIL, E L'UBICAZIONE IN COORDINATE GEOGRAFICHE#
#                     																	              #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                   #
#######################################################################################################################################################################

# whois_ip_Reperti_IP20()
# {
# echo "WHOIS Reperti_IP20" >> /path/Reperti/Estrazioni/Whois_Reperti_IP20.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP20.txt;
# for u25 in `cat /path/Reperti/Estrazioni/Reperti_IP20.txt`;  
# do  
# whois  $u25 >> /path/Reperti/Estrazioni/Whois_Reperti_IP20.txt;  
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Estrazioni/Whois_Reperti_IP20.txt;
# geoiplookup -f /usr/share/GeoIP/GeoLiteCity.dat $u25 >> /path/Reperti/Estrazioni/Whois_Reperti_IP20.txt; 
# cat /path/Reperti/Estrazioni/Whois_Reperti_IP20.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "WHOIS_REPERTI_IP20 ", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ESTRAZIONE DAL SERVER WHOIS                                #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

# checksum_whois_Reperti_IP20()
# {
# echo "CHECKSUM SHA256_Log_Hash_SHA256_MD5_Whois_Reperti_IP20" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP20.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP20.txt;
# for u26 in /path/Reperti/Estrazioni/Reperti_IP20.txt;
# do sha256sum "$u26" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP20.txt;
# echo "CHECKSUM MD5_Log_Hash_SHA256_MD5_Whois_Reperti_IP20" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP20.txt;
# date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP20.txt;
# md5sum "$u26" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP20.txt;
# cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Whois_Reperti_IP20.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
# done ;
# }


#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP1 ", SCRIVE UN Log_Traceroute_Reperti_IP1,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

set_traccia_percorso_effettuato_Reperti_IP1()
{
echo "Traceroute Reperti_IP1" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP1.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP1.txt;
for al in `cat /path/Reperti/Estrazioni/Reperti_IP1.txt`;
do    
traceroute -I -F -T -U  $al  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP1.txt;
cat /path/Reperti/Log/Log_Traceroute_Reperti_IP1.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP1", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

checksum_traceroute_Reperti_IP1()
{
echo "CHECKSUM SHA256_Traceroute_Reperti_IP1" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP1.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP1.txt;
for ab in /path/Reperti/Log/Log_Traceroute_Reperti_IP1.txt;
do sha256sum "$ab" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP1.txt;
echo "CHECKSUM MD5_Traceroute_Reperti_IP1" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP1.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP1.txt;
md5sum "$ab" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP1.txt;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP1.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}


#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP2 ", SCRIVE UN Log_Traceroute_Reperti_IP1,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

set_traccia_percorso_effettuato_Reperti_IP2()
{
echo "Traceroute Reperti_IP2" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP2.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP2.txt;
for ac in `cat /path/Reperti/Estrazioni/Reperti_IP2.txt`;
do    
traceroute -I -F -T -U  $ac  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP2.txt;
cat /path/Reperti/Log/Log_Traceroute_Reperti_IP2.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP2", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       # 
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

checksum_traceroute_Reperti_IP2()
{
echo "CHECKSUM SHA256_Traceroute_Reperti_IP2" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP2.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP2.txt;
for ad in /path/Reperti/Log/Log_Traceroute_Reperti_IP2.txt;
do sha256sum "$ad" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP2.txt;
echo "CHECKSUM MD5_Traceroute_Reperti_IP2" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP2.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP2.txt;
md5sum "$ad" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP2.txt;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP2.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP3 ", SCRIVE UN Log_Traceroute_Reperti_IP1,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE# 
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

set_traccia_percorso_effettuato_Reperti_IP3()
{
echo "Traceroute Reperti_IP2" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP3.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP3.txt;
for ae in `cat /path/Reperti/Estrazioni/Reperti_IP3.txt`;
do    
traceroute -I -F -T -U  $ae  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP3.txt;
cat /path/Reperti/Log/Log_Traceroute_Reperti_IP3.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP3", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

checksum_traceroute_Reperti_IP3()
{
echo "CHECKSUM SHA256_Traceroute_Reperti_IP3" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP3.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP3.txt;
for af in /path/Reperti/Log/Log_Traceroute_Reperti_IP3.txt;
do sha256sum "$af" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP3.txt;
echo "CHECKSUM MD5_Traceroute_Reperti_IP3" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP3.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP3.txt;
md5sum "$af" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP3.txt;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP3.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP4 ", SCRIVE UN Log_Traceroute_Reperti_IP1,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#  
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

set_traccia_percorso_effettuato_Reperti_IP4()
{
echo "Traceroute Reperti_IP4" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP4.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP4.txt;
for ag in `cat /path/Reperti/Estrazioni/Reperti_IP4.txt`;
do    
traceroute -I -F -T -U  $ag  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP4.txt;
cat /path/Reperti/Log/Log_Traceroute_Reperti_IP4.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP4", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #                                                                                               
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

checksum_traceroute_Reperti_IP4()
{
echo "CHECKSUM SHA256_Traceroute_Reperti_IP4" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP4.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP4.txt;
for ah in /path/Reperti/Log/Log_Traceroute_Reperti_IP4.txt;
do sha256sum "$ah" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP4.txt;
echo "CHECKSUM MD5_Traceroute_Reperti_IP4" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP4.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP4.txt;
md5sum "$ah" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP4.txt;
cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP4.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
done ;
}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP5 ", SCRIVE UN Log_Traceroute_Reperti_IP5,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP5()
#{
#echo "Traceroute Reperti_IP5" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP5.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP5.txt;
#for al1 in `cat /path/Reperti/Estrazioni/Reperti_IP5.txt`;
#do    
#traceroute -I -F -T -U  $al1  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP5.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP5.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP5", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DEI DATI                                                #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP5()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP5" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP5.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP5.txt;
#for al2 in /path/Reperti/Log/Log_Traceroute_Reperti_IP5.txt;
#do sha256sum "$al2" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP5.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP5" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP5.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP5.txt;
#md5sum "$al2" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP5.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP5.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}


#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP6 ", SCRIVE UN Log_Traceroute_Reperti_IP6,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP6()
#{
#echo "Traceroute Reperti_IP6" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP6.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP6.txt;
#for al3 in `cat /path/Reperti/Estrazioni/Reperti_IP6.txt`;
#do    
#traceroute -I -F -T -U  $al3  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP6.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP6.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP6", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP6()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP6" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt;
#for al4 in /path/Reperti/Log/Log_Traceroute_Reperti_IP6.txt;
#do sha256sum "$al4" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP6" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt;
#md5sum "$al4" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP6 ", SCRIVE UN Log_Traceroute_Reperti_IP6,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP6()
#{
#echo "Traceroute Reperti_IP6" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP6.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP6.txt;
#for al3 in `cat /path/Reperti/Estrazioni/Reperti_IP6.txt`;
#do    
#traceroute -I -F -T -U  $al3  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP6.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP6.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP6", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP6()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP6" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt;
#for al4 in /path/Reperti/Log/Log_Traceroute_Reperti_IP6.txt;
#do sha256sum "$al4" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP6" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt;
#md5sum "$al4" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP6.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP7 ", SCRIVE UN Log_Traceroute_Reperti_IP7,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP7()
#{
#echo "Traceroute Reperti_IP7" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP7.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP7.txt;
#for al5 in `cat /path/Reperti/Estrazioni/Reperti_IP7.txt`;
#do    
#traceroute -I -F -T -U  $al5  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP7.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP7.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP7", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP7()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP7" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP7.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP7.txt;
#for al6 in /path/Reperti/Log/Log_Traceroute_Reperti_IP7.txt;
#do sha256sum "$al6" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP7.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP7" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP7.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP7.txt;
#md5sum "$al6" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP7.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP7.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP8 ", SCRIVE UN Log_Traceroute_Reperti_IP8,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP8()
#{
#echo "Traceroute Reperti_IP8" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP8.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP8.txt;
#for al7 in `cat /path/Reperti/Estrazioni/Reperti_IP8.txt`;
#do    
#traceroute -I -F -T -U  $al7  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP8.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP8.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP8", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP8()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP8" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP8.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP8.txt;
#for al8 in /path/Reperti/Log/Log_Traceroute_Reperti_IP8.txt;
#do sha256sum "$al8" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP8.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP8" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP8.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP8.txt;
#md5sum "$al8" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP8.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP8.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP9 ", SCRIVE UN Log_Traceroute_Reperti_IP9,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP9()
#{
#echo "Traceroute Reperti_IP9" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP9.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP9.txt;
#for al9 in `cat /path/Reperti/Estrazioni/Reperti_IP9.txt`;
#do    
#traceroute -I -F -T -U  $al9  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP9.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP9.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP9", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP9()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP9" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP9.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP9.txt;
#for a30 in /path/Reperti/Log/Log_Traceroute_Reperti_IP9.txt;
#do sha256sum "$a30" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP9.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP9" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP9.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP9.txt;
#md5sum "$a30" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP9.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP9.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}


#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP10 ", SCRIVE UN Log_Traceroute_Reperti_IP10,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP10()
#{
#echo "Traceroute Reperti_IP10" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP10.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP10.txt;
#for a31 in `cat /path/Reperti/Estrazioni/Reperti_IP10.txt`;
#do    
#traceroute -I -F -T -U  $a31  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP10.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP10.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP10", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP10()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt;
#for a32 in /path/Reperti/Log/Log_Traceroute_Reperti_IP10.txt;
#do sha256sum "$a32" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP10" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt;
#md5sum "$a32" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP10 ", SCRIVE UN Log_Traceroute_Reperti_IP10,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP10()
#{
#echo "Traceroute Reperti_IP10" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP10.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP10.txt;
#for a33 in `cat /path/Reperti/Estrazioni/Reperti_IP10.txt`;
#do    
#traceroute -I -F -T -U  $a33  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP10.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP10.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP10", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP10()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP10" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt;
#for a34 in /path/Reperti/Log/Log_Traceroute_Reperti_IP10.txt;
#do sha256sum "$a34" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP10" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt;
#md5sum "$a34" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP10.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP11 ", SCRIVE UN Log_Traceroute_Reperti_IP11,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP11()
#{
#echo "Traceroute Reperti_IP11" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP11.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP11.txt;
#for a35 in `cat /path/Reperti/Estrazioni/Reperti_IP11.txt`;
#do    
#traceroute -I -F -T -U  $a35  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP11.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP11.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP11", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP11()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP11" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP11.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP11.txt;
#for a36 in /path/Reperti/Log/Log_Traceroute_Reperti_IP11.txt;
#do sha256sum "$a36" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP11.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP11" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP11.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP11.txt;
#md5sum "$a37" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP11.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP11.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP12 ", SCRIVE UN Log_Traceroute_Reperti_IP12,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP12()
#{
#echo "Traceroute Reperti_IP12" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP12.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP12.txt;
#for a37 in `cat /path/Reperti/Estrazioni/Reperti_IP12.txt`;
#do    
#traceroute -I -F -T -U  $a37  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP12.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP12.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP12", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP12()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP12" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP12.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP12.txt;
#for a38 in /path/Reperti/Log/Log_Traceroute_Reperti_IP12.txt;
#do sha256sum "$a38" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP12.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP12" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP12.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP12.txt;
#md5sum "$a38" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP12.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP12.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP13 ", SCRIVE UN Log_Traceroute_Reperti_IP13,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP13()
#{
#echo "Traceroute Reperti_IP13" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP13.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP13.txt;
#for a39 in `cat /path/Reperti/Estrazioni/Reperti_IP13.txt`;
#do    
#traceroute -I -F -T -U  $a39  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP13.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP13.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP13", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP13()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP13" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP13.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP13.txt;
#for a40 in /path/Reperti/Log/Log_Traceroute_Reperti_IP13.txt;
#do sha256sum "$a40" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP13.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP13" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP13.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP13.txt;
#md5sum "$a40" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP13.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP13.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP14 ", SCRIVE UN Log_Traceroute_Reperti_IP14,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP14()
#{
#echo "Traceroute Reperti_IP14" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP14.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP14.txt;
#for a41 in `cat /path/Reperti/Estrazioni/Reperti_IP14.txt`;
#do    
#traceroute -I -F -T -U  $a41  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP14.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP14.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP14", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP14()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP14" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP14.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP14.txt;
#for a42 in /path/Reperti/Log/Log_Traceroute_Reperti_IP14.txt;
#do sha256sum "$a42" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP14.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP14" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP14.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP14.txt;
#md5sum "$a42" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP14.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP14.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP15 ", SCRIVE UN Log_Traceroute_Reperti_IP15,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP15()
#{
#echo "Traceroute Reperti_IP15" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP15.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP15.txt;
#for a43 in `cat /path/Reperti/Estrazioni/Reperti_IP15.txt`;
#do    
#traceroute -I -F -T -U  $a43  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP15.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP15.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP15", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP15()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP15" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP15.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP15.txt;
#for a44 in /path/Reperti/Log/Log_Traceroute_Reperti_IP15.txt;
#do sha256sum "$a44" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP15.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP15" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP15.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP15.txt;
#md5sum "$a44" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP15.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP15.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP16 ", SCRIVE UN Log_Traceroute_Reperti_IP16,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP16()
#{
#echo "Traceroute Reperti_IP16" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP16.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP16.txt;
#for a45 in `cat /path/Reperti/Estrazioni/Reperti_IP16.txt`;
#do    
#traceroute -I -F -T -U  $a45  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP16.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP16.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP16", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP16()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP16" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP16.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP16.txt;
#for a46 in /path/Reperti/Log/Log_Traceroute_Reperti_IP16.txt;
#do sha256sum "$a46" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP16.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP16" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP16.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP16.txt;
#md5sum "$a46" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP16.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP16.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP17 ", SCRIVE UN Log_Traceroute_Reperti_IP17,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP17()
#{
#echo "Traceroute Reperti_IP17" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP17.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP17.txt;
#for a47 in `cat /path/Reperti/Estrazioni/Reperti_IP17.txt`;
#do    
#traceroute -I -F -T -U  $a47  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP17.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP17.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP17", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP17()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP17" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP17.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP17.txt;
#for a48 in /path/Reperti/Log/Log_Traceroute_Reperti_IP17.txt;
#do sha256sum "$a48" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP17.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP17" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP17.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP17.txt;
#md5sum "$a48" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP17.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP17.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP18 ", SCRIVE UN Log_Traceroute_Reperti_IP18,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP18()
#{
#echo "Traceroute Reperti_IP18" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP18.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP18.txt;
#for a49 in `cat /path/Reperti/Estrazioni/Reperti_IP18.txt`;
#do    
#traceroute -I -F -T -U  $a49  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP18.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP18.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP18", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP18()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP18" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP18.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP18.txt;
#for a50 in /path/Reperti/Log/Log_Traceroute_Reperti_IP18.txt;
#do sha256sum "$a50" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP18.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP18" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP18.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP18.txt;
#md5sum "$a50" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP18.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP18.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

#############################################################################################################################################################################
# TRACEROUTE DEL REPERTO LOG "REPERTI_IP19 ", SCRIVE UN Log_Traceroute_Reperti_IP19,TUTTO IL PERCORSO CHE HA FATTO L'IP DELL'E-MAIL INVIATA FINO ALL'UTENTE CHE L'HA RICEVUTAE#     
#                     																	                    #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                                         #
#############################################################################################################################################################################

#set_traccia_percorso_effettuato_Reperti_IP19()
#{
#echo "Traceroute Reperti_IP19" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP19.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Traceroute_Reperti_IP19.txt;
#for a51 in `cat /path/Reperti/Estrazioni/Reperti_IP19.txt`;
#do    
#traceroute -I -F -T -U  $a51  >>/path/Reperti/Log/Log_Traceroute_Reperti_IP19.txt;
#cat /path/Reperti/Log/Log_Traceroute_Reperti_IP19.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}

##############################################################################################################################################################
#     CHECKSUM DEL REPERTO LOG "Log_Traceroute_Reperti_IP19", VIENE CREATO PER VALIDARE L'ORIGINALITÀ DELL'ANALISI DEL PERCORSO DELL'IP                       #  
#                     																	     #
# VIENE AGGIORNATO IL REPORT DELLE ESTRAZIONE HEADERS E-MAIL, PER POTER PROCEDERE ALL'ANALISI E ALLA RELAZIONE DELL'INDAGINE SVOLTA                          #
##############################################################################################################################################################

#checksum_traceroute_Reperti_IP19()
#{
#echo "CHECKSUM SHA256_Traceroute_Reperti_IP19" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP19.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP19.txt;
#for a52 in /path/Reperti/Log/Log_Traceroute_Reperti_IP19.txt;
#do sha256sum "$a52" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP19.txt;
#echo "CHECKSUM MD5_Traceroute_Reperti_IP19" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP19.txt;
#date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP19.txt;
#md5sum "$a52" >>  /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP19.txt;
#cat /path/Reperti/Log/Log_Hash_SHA256_MD5_Traceroute_Reperti_IP19.txt >> /path/Reperti/Estrazioni/REPORT_ESTRAZIONE_HEADERS_EMAIL_DEL_SOSPETTATO.txt;
#done ;
#}


#############################################################################################################################################################################
# COMPRESSIONE DELLA DIRECTORY REPERTI PER CONSERVARE TUTTI I REPERTI E I FILE DI HASHING PER LA TRASCRIZIONE DELLA PERIZIA                      			    #			
# CREAZIONE DELLA LISTA REPERTI E FILE HASHING  COMPRESSI                                                          	                    				    #
# COMPRESSIONE DELLA DIRECTORY COMPRESSA REPERTI IN .TAR.BZIP2 INSIEME ALLA LISTA REPERTI E FILE HASHING                                                             	    #
#																					    #
#############################################################################################################################################################################
creazione_file_reperti_tar_bz2_lista_reperti()
{
tar -czvf Reperti.tar.bz2 /path/Reperti/ ;
tar -tf Reperti.tar.bz2 >> /path/Lista_Reperti.txt;
}

##############################################################################################################################################################
#     CHECKSUM DELLA DIRECTORY REPERTI.TAR.BZ2 E LISTA REPERTI E FILE HASHING	                             						     #                                                                                               
#                     																	     #
#                         																     #
##############################################################################################################################################################

checksum_reperti_tar_bz2()
{
echo "CHECKSUM Tar_Bzip2_Log_Reperti_e_files_hashing" >> /path/Log_Hash_SHA256_MD5_Reperti_Tar_Bz2.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Log_Hash_SHA256_MD5_Reperti_Tar_Bz2.txt;
for ca in /path/Reperti.tar.bz2;
do sha256sum "$ca" >> /path/Log_Hash_SHA256_MD5_Reperti_Tar_Bz2.txt;
echo "CHECKSUM MD5_Lista dei Reperti e file di Hashing compressi" >>  /path/Log_Hash_SHA256_MD5_Reperti_Tar_Bz2.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Log_Hash_SHA256_MD5_Reperti_Tar_Bz2.txt;
md5sum "$ca" >>  /path/Log_Hash_SHA256_MD5_Reperti_Tar_Bz2.txt;
done ;
}

checksum_Lista_Reperti()
{
echo "CHECKSUM Tar_Bzip2_Log_Reperti_e_files_hashing" >> /path/Log_Hash_SHA256_MD5_Lista_Reperti.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Log_Hash_SHA256_MD5_Lista_Reperti.txt;
for ca1 in /path/Lista_Reperti.txt;
do sha256sum "$ca1" >> /path/Log_Hash_SHA256_MD5_Lista_Reperti.txt;
echo "CHECKSUM MD5_Lista dei Reperti e file di Hashing compressi" >>  /path/Log_Hash_SHA256_MD5_Lista_Reperti.txt;
date +"[%d/%b/%Y:%k:%M:%S %z]" >> /path/Log_Hash_SHA256_MD5_Lista_Reperti.txt;
md5sum "$ca1" >>  /path/Log_Hash_SHA256_MD5_Lista_Reperti.txt;
done ;
}

#############################################################################################################################################################################
#    DECOMPRESSIONE DELLA DIRECTORY REPERTI.TAR.BZ2												               	            #
#																					    #
#############################################################################################################################################################################

decompressione_Reerti_Tar_Bzi2()
{
tar -xvvf /path/Reperti.tar.bz2 
}

#############################################################################################################################################################################
#    APPLICAZIONE FIRMA DIGITALE GPG PER TESTIMONIARE LA CATENA DI CUSTODIA     								               	            #
#																					    #
#############################################################################################################################################################################

#
firma_gpg()
{
gpg --output /path/Reperti.tar.bz2.sig --detach-sig /path/Reperti.tar.bz2;
gpg --output /path/Lista_Reperti.txt.sig --detach-sig /path/Lista_Reperti.txt;
gpg --output /path/Log_Hash_SHA256_MD5_Reperti_Tar_Bz2.txt.sig --detach-sig /path/Log_Hash_SHA256_MD5_Reperti_Tar_Bz2.txt ;
gpg --output /path/Log_Hash_SHA256_MD5_Lista_Reperti.txt.sig --detach-sig /path/Log_Hash_SHA256_MD5_Lista_Reperti.txt ;
}

#############################################################################################################################################################################
# VERIFICA DELLA FIRMA DIGITALE, DEGLI UTENTI CHE HANNO SOTTOPOSTO A PERIZIA I REPERTI ED HANNO FIRMATO PER LA CATENA DI CONSERVAZIONE CON LORO VOLTA CON LA FIRMA GPG      #
#                                                                                                                                                                           #
##############################################################################################################################################################################

verifica_firma_gpg()
{
gpg --verify /path/Reperti.tar.bz2.sig /path/Reperti.tar.bz2 ;
gpg --verify /path/Lista_Reperti.txt.sig ;
gpg --verify /path/Log_Hash_SHA256_MD5_Reperti_Tar_Bz2.txt.sig ;
gpg --verify /path/Reperti.tar.bz2.sig ;
}

##############################################################################################################################
#					CREAZIONE IMMAGINE ISO 												     #
#															     #
#															     #
##############################################################################################################################
creazione_immagine_iso()
{
mkisofs -J -o Reperti_Caso_NR_REO_NOME_COGNOME.iso /path/Reperti.tar.bz2 /path/Lista_Reperti.txt /path/Lista_Reperti.txt.sig /path/Reperti.tar.bz2.sig /path/Log_Hash_SHA256_MD5_Lista_Reperti.txt /path/Log_Hash_SHA256_MD5_Lista_Reperti.txt.sig /path/Log_Hash_SHA256_MD5_Reperti_Tar_Bz2.txt /path/Log_Hash_SHA256_MD5_Reperti_Tar_Bz2.txt.sig                        											
}

#######################################################################
#	MONTAGGIO IN LOCALE IMMAGINE ISO E VERIFICA ESISTENZA DATI    #
#								      #
#######################################################################
verifica_iso()
{
sudo mkdir -p /tmp/dvd
sudo mount -o loop,exec /path/Reperti_Caso_N_3_REO_18102018.iso /tmp/dvd
ls -la /tmp/dvd/
sudo umount /tmp/dev/ 
}


#############################################################################################################################################################################
#    ELIMINAZIONE DELLE DIRECTORY DEI REPERTI E FILE DI HASHING, DIRECTORY REPERTI COMPRESSA CON TAR E BZIP2, LOG CHECKSUM E LISTA REPERTI               	            #
#																					    #
#############################################################################################################################################################################

deleting_DReperti_Lista_Reperti_DRepertiCompresse()
{
echo " Eliminazione dei della Directory Temporanea dei Reperti";
rm -rf /path/Reperti;
rm -rf /path/Reperti.tar.bz2;
rm -rf /path/Lista_Reperti.txt;
rm -rf /path/Lista_Reperti.txt;
rm -rf /path/Log_Hash_SHA256_MD5_Lista_Reperti.txt;
rm -rf /path/Log_Hash_SHA256_MD5_Lista_Reperti.txt;
rm -rf /path/Log_Hash_SHA256_MD5_Reperti_Tar_Bz2.txt;
rm -rf /path/Log_Hash_SHA256_MD5_Reperti_Tar_Bz2.txt.sig;
echo " Eliminazione dati completata" ;
}

############################################
# GRUPPO INIZIA OPERAZIONE                 #
#                                          #
############################################
set_inzia_operazione()
{
create_directory
inizio_operazione_estrazione
checksum_email1
checksum_email2
checksum_email3
checksum_email4
#checksum_email5
#checksum_email6
#checksum_email7
#checksum_email8
#checksum_email9
#checksum_email10
#checksum_email11
#checksum_email12
#checksum_email13
#checksum_email14
#checksum_email15
#checksum_email16
#checksum_email17
#checksum_email17
#checksum_email18
#checksum_email19
#checksum_email20
checksum_copia_email1
checksum_copia_email2
checksum_copia_email3
checksum_copia_email4
#checksum_copia_email5
#checksum_copia_email6
#checksum_copia_email7
#checksum_copia_email8
#checksum_copia_email9
#checksum_copia_email10
#checksum_copia_email11
#checksum_copia_email12
#checksum_copia_email13
#checksum_copia_email14
#checksum_copia_email15
#checksum_copia_email16
#checksum_copia_email17
#checksum_copia_email18
#checksum_copia_email19#
#checksum_copia_email20
}

################################################
#            GRUPPO ESTRAZIONE                 #
#                                              #
################################################
set_estrazione()
{
estrazione_headers_copia_email1
checksum_estrazione_headers_copia_email1
estrazione_ip_headers_copia_email1
checksum_copia_repertiIP1
estrazione_headers_copia_email2
checksum_estrazione_headers_copia_email2
estrazione_ip_headers_copia_email2
checksum_copia_repertiIP2
estrazione_headers_copia_email3
checksum_estrazione_headers_copia_email3
estrazione_ip_headers_copia_email3
checksum_copia_repertiIP3
estrazione_headers_copia_email4
checksum_estrazione_headers_copia_email4
estrazione_ip_headers_copia_email4
checksum_copia_repertiIP4
#estrazione_ip_headers_copia_email5
#checksum_estrazione_headers_copia_email5
#checksum_copia_repertiIP#5
#estrazione_ip_headers_copia_email6
#checksum_estrazione_headers_copia_email6
#checksum_copia_repertiIP6
#estrazione_ip_headers_copia_email7
#checksum_estrazione_headers_copia_email7
#checksum_copia_repertiIP7
#estrazione_ip_headers_copia_email8
#checksum_estrazione_headers_copia_email8
#checksum_copia_repertiIP8
#estrazione_ip_headers_copia_email9
#checksum_estrazione_headers_copia_email9
#checksum_copia_repertiIP9
#estrazione_ip_headers_copia_email10
#checksum_estrazione_headers_copia_email10
#checksum_copia_repertiIP10
#estrazione_ip_headers_copia_email11
#checksum_estrazione_headers_copia_email11
#checksum_copia_repertiIP11
#estrazione_ip_headers_copia_email12
#checksum_estrazione_headers_copia_email12
#checksum_copia_repertiIP12
#estrazione_ip_headers_copia_email13
#checksum_estrazione_headers_copia_email13
#checksum_copia_repertiIP13
#estrazione_ip_headers_copia_email14
#checksum_estrazione_headers_copia_email14
#checksum_copia_repertiIP14
#estrazione_ip_headers_copia_email15
#checksum_estrazione_headers_copia_email15
#checksum_copia_repertiIP15
#estrazione_ip_headers_copia_email16
#checksum_estrazione_headers_copia_email16
#checksum_copia_repertiIP16
#estrazione_ip_headers_copia_email17
#checksum_estrazione_headers_copia_email17
#checksum_copia_repertiIP17
#estrazione_ip_headers_copia_email18
#checksum_estrazione_headers_copia_email18
#checksum_copia_repertiIP18
#estrazione_ip_headers_copia_email19
#checksum_estrazione_headers_copia_email19
#checksum_copia_repertiIP19
#estrazione_ip_headers_copia_email20
#checksum_estrazione_headers_copia_email20
#checksum_copia_repertiIP20
}

#################################################
#     GRUPPO WHOIS				#
#						#
#################################################

set_localizza_ip()
{
whois_ip_Reperti_IP1
checksum_whois_Reperti_IP1
whois_ip_Reperti_IP2
checksum_whois_Reperti_IP2
whois_ip_Reperti_IP3
checksum_whois_Reperti_IP3
whois_ip_Reperti_IP4
checksum_whois_Reperti_IP4
#whois_ip_Reperti_IP5
#checksum_whois_Reperti_IP5
#whois_ip_Reperti_IP6
#checksum_whois_Reperti_IP6
#whois_iwhois_ip_Reperti_IP7
#checksum_whois_Reperti_IP7
#whois_iwhois_ip_Reperti_IP8
#checksum_whois_Reperti_IP8
#whois_ip_Reperti_IP9
#checksum_whois_Reperti_IP9
#whois_ip_Reperti_IP10
#checksum_whois_Reperti_IP10
#whois_ip_Reperti_IP11
#checksum_whois_Reperti_IP11
#whois_ip_Reperti_IP12
#checksum_whois_Reperti_IP12
#whois_ip_Reperti_IP13
#checksum_whois_Reperti_IP13
#whois_ip_Reperti_IP14
#checksum_whois_Reperti_IP14
#whois_ip_Reperti_IP15
#checksum_whois_Reperti_IP15
#whois_ip_Reperti_IP16
#checksum_whois_Reperti_IP16
#whois_ip_Reperti_IP17
#checksum_whois_Reperti_IP17
#whois_ip_Reperti_IP18
#checksum_whois_Reperti_IP18
#whois_ip_Reperti_IP19
#checksum_whois_Reperti_IP19
#whois_ip_Reperti_IP20
#checksum_whois_Reperti_IP20
}

###################################################
#	GRUPPO ESTRAZIONE			  #
#						  #
###################################################
set_traceroute_reperti_ip ()
{
set_traccia_percorso_effettuato_Reperti_IP1
checksum_traceroute_Reperti_IP1
set_traccia_percorso_effettuato_Reperti_IP2
checksum_traceroute_Reperti_IP2
set_traccia_percorso_effettuato_Reperti_IP3
checksum_traceroute_Reperti_IP3
set_traccia_percorso_effettuato_Reperti_IP4
checksum_traceroute_Reperti_IP4
#set_traccia_percorso_effettuato_Reperti_IP5
#checksum_traceroute_Reperti_IP5
#set_traccia_percorso_effettuato_Reperti_IP6
#checksum_traceroute_Reperti_IP6
#set_traccia_percorso_effettuato_Reperti_IP7
#checksum_traceroute_Reperti_IP7
#set_traccia_percorso_effettuato_Reperti_IP8
#checksum_traceroute_Reperti_IP8
#set_traccia_percorso_effettuato_Reperti_IP9
#checksum_traceroute_Reperti_IP9
#set_traccia_percorso_effettuato_Reperti_IP10
#checksum_traceroute_Reperti_IP10
#set_traccia_percorso_effettuato_Reperti_IP11
#checksum_traceroute_Reperti_IP11
#set_traccia_percorso_effettuato_Reperti_IP12
#checksum_traceroute_Reperti_IP12
#set_traccia_percorso_effettuato_Reperti_IP13
#checksum_traceroute_Reperti_IP13
#set_traccia_percorso_effettuato_Reperti_IP14
#checksum_traceroute_Reperti_IP14
#set_traccia_percorso_effettuato_Reperti_IP15
#checksum_traceroute_Reperti_IP15
#Set_traccia_percorso_effettuato_Reperti_IP16
#checksum_traceroute_Reperti_IP16
#set_traccia_percorso_effettuato_Reperti_IP17
#checksum_traceroute_Reperti_IP17
#set_traccia_percorso_effettuato_Reperti_IP18
#checksum_traceroute_Reperti_IP18
#set_traccia_percorso_effettuato_Reperti_IP19
#checksum_traceroute_Reperti_IP19
#set_traccia_percorso_effettuato_Reperti_IP20
#checksum_traceroute_Reperti_IP20
}

###################################################
#	GRUPPO COMPRESSIONE			  #
#						  #
###################################################
set_compressione()
{
creazione_file_reperti_tar_bz2_lista_reperti
checksum_reperti_tar_bz2
checksum_Lista_Reperti
}

##################################################
#  RIMOZIONE DATI				#
##################################################
set_rimozione_dati()
{
deleting_DReperti_Lista_Reperti_DRepertiCompresse
}

#################################################
#    GRUPPO DECOMPRESSIONE			#
#################################################

set_decompressione()
{
decompressione_Reerti_Tar_Bzi2
}

#############################################
#  SEZIONE FIRMA DIGITALE GPG               #
#############################################
set_firma_digitale()
{
firma_gpg
}

###########################################
#  SEZIONE VERIFICA FIRMA DIGITALE GPG    #
##########################################

set_verifca_firma()
{
verifica_firma_gpg
}

###########################################
#  SEZIONE CREAZIONE IMMAGINE ISO         #
##########################################

set_crea_iso()
{
creazione_immagine_iso
}
###########################################
#  SEZIONE Verifica IMMAGINE ISO         #
##########################################
set_verifico_iso()
{
verifica_iso
}

# MAIN
case "${opt}" in
  start)
     echo "start Operazione."
     set_inzia_operazione
     ;;
  estrazione)
     echo "estrazione"
     set_estrazione
     ;;
  localizza_ip)
     echo "whois"
     set_localizza_ip
     ;;
  traccia_percorso)
     echo "traccia_percorso"
     set_traceroute_reperti_ip
     ;;
  compressione)
     echo "compressione"
     set_compressione
     ;;
  applica_firma_digitale)
     echo "applica_firma_digitale"
     set_firma_digitale
     ;; 
  verifica_firma)   
     echo "verifica_firma"
     set_verifca_firma
     ;; 
  crea_iso)
     echo "crea_iso"
     set_crea_iso
     ;;
  verifica_iso)
     echo "verifica_iso"
     set_verifico_iso
     ;;
  rimozione_dati)
     echo "rimozione_dati"
     set_rimozione_dati
     ;;
  decompressione )
     echo "decompressione"
     set_decompressione
     ;; 
   *)
     echo "Utilizzo: $0 {start|estrazione|localizza_ip|traccia_percorso|compressione|applica_firma_digitale|verifica_firma|crea_iso|verifica_iso|rimozione_dati|decompressione)"
     exit 
     ;;
 esac
exit 0
