#!/bin/bash

#unzip all the files
for file in statement*.zip
do
    unzip "$file"
done

#prefix the files with their correct prefix
./addprefix.sh "INVOICE #" invoice
./addprefix.sh "CREDIT " credit
./addprefix.sh "RECEIPT " receipt

# add all requested files to a single zip file
zip invoices-upwork invoice_*.pdf credit_*.pdf
rm *pdf
echo "Created invoices-upwork.zip for you"
