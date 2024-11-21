process ORDER_AND_ORIENT {

    tag "$fasta"
    label 'process_high'
    container 'ilepeli/viral_assemble:latest'

    input:
    val(sample_id)
    path(contigs)
    path(chosen_ref) // file containing path of best ref
    path(refs)

    script:

    """
    best_ref=\$(cat ${chosen_ref})

    assembly.py order_and_orient \\
    ${contigs} \\
    \$best_ref \\
    ${sample_id}_intermediate_scaffold.fasta \\
    --loglevel=DEBUG

    """
    
}