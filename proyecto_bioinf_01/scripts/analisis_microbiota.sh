#Crear un directorio para nuestros datos:
mkdir qiime2-atacama-tutorial 

#Ingresar al directorio:
cd qiime2-atacama-tutorial

wget -O "sample-metadata.tsv" "https://data.qiime2.org/2023.5/tutorials/atacama-soils/sample_metadata.tsv"

mkdir emp-paired-end-sequences


wget -O "emp-paired-end-sequences/forward.fastq.gz" "https://data.qiime2.org/2023.5/tutorials/atacama-soils/10p/forward.fastq.gz"

wget -O "emp-paired-end-sequences/reverse.fastq.gz" "https://data.qiime2.org/2023.5/tutorials/atacama-soils/10p/reverse.fastq.gz"

wget -O "emp-paired-end-sequences/barcodes.fastq.gz" "https://data.qiime2.org/2023.5/tutorials/atacama-soils/10p/barcodes.fastq.gz"


#Crear artefacto:
qiime tools import --type EMPPairedEndSequences --input-path emp-paired-end-sequences --output-path emp-paired-end-sequences.qza


qiime demux emp-paired --m-barcodes-file sample-metadata.tsv --m-barcodes-column barcode-sequence --p-rev-comp-mapping-barcodes --i-seqs emp-paired-end-sequences.qza --o-per-sample-sequences demux-full.qza --o-error-correction-details demux-details.qza


#Crear submuestra:
qiime demux subsample-paired --i-sequences demux-full.qza --p-fraction 0.3 --o-subsampled-sequences demux-subsample.qza


#Crear visualización para conocer cuantas secuencias tenemos por muestra:
qiime demux summarize --i-data demux-subsample.qza --o-visualization demux-subsample.qzv


qiime tools export --input-path demux-subsample.qzv --output-path ./demux-subsample/

qiime demux filter-samples --i-demux demux-subsample.qza --m-metadata-file ./demux-subsample/per-sample-fastq-counts.tsv --p-where 'CAST([forward sequence count] AS INT) > 100' --o-filtered-demux demux.qza


#Revisar calidad y realizar “denoising”:
qiime dada2 denoise-paired --i-demultiplexed-seqs demux.qza --p-trim-left-f 13 --p-trim-left-r 13 --p-trunc-len-f 150 --p-trunc-len-r 150 --o-table table.qza --o-representative-sequences rep-seqs.qza --o-denoising-stats denoising-stats.qza


#Podemos generar resúmenes de estos archivos:
qiime feature-table summarize --i-table table.qza --o-visualization table.qzv --m-sample-metadata-file sample-metadata.tsv

qiime feature-table tabulate-seqs --i-data rep-seqs.qza --o-visualization rep-seqs.qzv

qiime metadata tabulate --m-input-file denoising-stats.qza --o-visualization denoising-stats.qzv

