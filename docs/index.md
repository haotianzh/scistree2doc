
# About
**ScisTree2 is a tool for fast cell lineage tree reconstruction and genotype calling from noisy single-cell DNA sequencing data.**

## Background
#### Cell lineage tree
In a multicellular organism, cell lineages share a common evolutionary history. Knowing this history can facilitate the study of development, aging, and cancer. Cell lineage trees represent the evolutionary history of cells sampled from an organism. 

![A cell lineage tree with 5 cells and 4 SNVs](imgs/clt.png)

The figure displays a simple cell lineage tree of five cells ($C_1$ through $C_5$). In this tree, cells $C_1$ and $C_2$ are siblings, as are $C_4$ and $C_5$. Furthermore, cell $C_3$ is more closely related to the clade $(C_1,C_2)$ than to the clade $(C_4,C_5)$.


#### Single-cell DNA-seq
Recent developments in single-cell sequencing have greatly facilitated the inference of cell lineage trees. However, single-cell data are sparse and noisy, and the size of single-cell data is increasing rapidly. Accurate inference of cell lineage tree from large single-cell data is computationally challenging, 
There are multiple types of errors:
- Allelic dropout
- Sequencing error
- Coverage
- Doublet
- Copy number varation


#### Genotype and Infinite-Site(IS) model
Once the DNA of individual cells has been sequenced, a process called **variant calling** is used to identify mutation sites. This is done by comparing each cell's DNA sequence against a reference genome.

![](./imgs/geno.png)

At each identified mutation site, such as a Single Nucleotide Variant (SNV), the cell's genetic state (allele) is assigned a binary value:
* **0 (Wild-Type):** The allele is identical to the reference genome.
* **1 (Mutant):** The allele differs from the reference genome.

A cell's overall **genotype** is therefore defined as the set of binary values describing its state across all relevant mutation sites.

When these acquired mutations are mapped onto the branches of a cell lineage tree, the developmental relationships between cells become clear. This mapping reveals how mutations are passed down and accumulate through generations of cell division. In this context, a **clade** is a group of cells that all share a common set of mutations inherited from a single ancestor.

![](./imgs//mutmap.png)

A key assumption often used in these analyses is the **Infinite Sites (IS) model**. This model assumes that a mutation at any specific genomic location can occur only once throughout the entire history of the lineage. Consequently, the exact same mutation cannot arise independently in different branches (an event known as homoplasy), nor can a mutant allele revert to the wild-type state. As the figure illustrates, the "repeated blue diamond" appearing on separate lineages would violate the assumptions of the IS model.


#### What is ScisTree2
ScisTree2 is a fast and accurate cell lineage tree inference and genotype calling approach based on the infinite-sites model. ScisTree2 relies on an efficient local search approach to find optimal trees. ScisTree2 also calls single-cell genotypes based on the inferred cell lineage tree. ScisTree2 is the first model-based cell lineage tree inference and genotype calling approach that is capable of handling datasets from tens of thousands of cells or more.

![ScisTree2 infers a cell lineage tree from noisy genotype](imgs/g2t.png)

#### Algorithm overview
Local search: 
- start from an initial tree (say built by neighbor joining)
- move to the best neighboring tree (with highest probability) of current tree by rearranging the current tree by NNI or SPR
- repeated util converge

Nearest neighbor interchange  (NNI): swap adjacent branches
![Nearest neighbor interchange](imgs/nni.png)

Subtree prune and regraft (SPR): move a subtree to another (possible very far) location. 
![Subtree prune and regraft](imgs/spr.png)

