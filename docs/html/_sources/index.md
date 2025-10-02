
# About
**ScisTree2 is a tool for fast cell lineage tree reconstruction and genotype calling from noisy single-cell DNA sequencing data.**

## Background
#### Cell lineage tree
In a multicellular organism, cell lineages share a common evolutionary history. Knowing this history can facilitate the study of development, aging, and cancer. Cell lineage trees represent the evolutionary history of cells sampled from an organism. 

![A cell lineage tree with 5 cells and 4 SNVs](imgs/clt.png)

#### Single-cell DNA-seq
Recent developments in single-cell sequencing have greatly facilitated the inference of cell lineage trees. However, single-cell data are sparse and noisy, and the size of single-cell data is increasing rapidly. Accurate inference of cell lineage tree from large single-cell data is computationally challenging, 
There are multiple types of errors:
- Allelic dropout
- Sequencing error
- Coverage
- Doublet
- Copy number varation

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

