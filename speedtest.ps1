# Run speedtest and output to memory (commented out would be to output to file
echo "`nRunning speed test..."
#.\speedtest.exe | Out-File .\temp.csv
$speedtest = .\speedtest.exe
echo "Done!"

# Separate lines 
echo "`nParsing data..."
$latency_line	 = type .\test.txt | Select-String -Pattern Latency
$download_line	 = type .\test.txt | Select-String -Pattern Download
$upload_line	 = type .\test.txt | Select-String -Pattern Upload
$packetLoss_line = type .\test.txt | Select-String -Pattern Packet
echo "Lines parsed!"

# Set variables for writing out (it looks like junk)
echo "`nSetting variables..."
# Find Latency and Jitter, put into variables
$junk,$junk,$latency,$junk,$jitterJunk,$junk,$junk = $latency_line -split '\s+'
$junk,$jitter = $jitterJunk -split '\('
# Find Download speed
$junk,$junk,$download,$junk,$junk,$junk,$down_data_used,$junk,$junk = $download_line -split '\s+'
# Find Upload speed
$junk,$junk,$upload,$junk,$junk,$junk,$up_data_used,$junk,$junk = $upload_line -split '\s+'
# Find Packet Loss
$junk,$junk,$packetLoss = $packetLoss_line -split '\s+'
echo "Variables set!"

# Echo variables to shell
echo "`nLatency = "
$latency
echo 'Jitter = '
$jitter
echo 'Download = '
$download
echo 'Upload = '
$upload
echo 'Packet loss = '
$packetLoss

# Write all variables to excel file...
# TODO: figure out a way to append to excel file
echo "`nWriting out to file..."
# Write out to file
echo "Writing done!"

echo "`n`nAll done!`n"
