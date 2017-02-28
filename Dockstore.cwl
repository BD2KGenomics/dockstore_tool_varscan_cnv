#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

id: Varscan2
label: Varscan2 workflow

baseCommand: ['-s', './']

description: |
    A Docker container for a Varscan2 workflow. See the [github repo](https://github.com/Jeltje/varscan2) for more information.

requirements:
  - class: DockerRequirement
    dockerPull: quay.io/ucsc_cgl/varscan_cnv

inputs:
  genome:
    type: File
    doc: Genome fasta
    format: http://edamontology.org/format_1929
    inputBinding:
      prefix: -i

  centromeres:
    type: File
    doc: Centromere bed file
    format: http://edamontology.org/format_3003
    inputBinding:
      prefix: -b

  targets:
    type: File
    doc: Exome Targets bed file
    format: http://edamontology.org/format_3003
    inputBinding:
      prefix: -w

  control_bam_input:
    type: File
    doc: The control exome BAM file used as input, it must be sorted.
    format: http://edamontology.org/format_2572
    inputBinding:
      prefix: -c 

  tumor_bam_input:
    type: File
    doc: The tumor exome BAM file used as input, it must be sorted.
    format: http://edamontology.org/format_2572
    inputBinding:
      prefix: -t 

  sample_id:
    type: string?
    default: mypatient
    doc: sample ID to use in output
    inputBinding:
      prefix: -q 


stdout: output.cnv

outputs: 
  - id: output
    type: stdout


