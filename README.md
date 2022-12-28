# End-to-End Visual Editing with a Generatively Pre-Trained Artist
Official repository for the paper ["End-to-End Visual Editing with a Generatively Pre-Trained Artist"](https://www.robots.ox.ac.uk/~abrown/E2EVE/), which will appear at ECCV 2022. Here, we consider the targeted image editing problem: blending a region in a source image with a driver image that specifies the desired change. Differently from prior works, we solve this problem by learning a conditional probability distribution of the edits, end-to-end.

<div align="center">
  
| inputs and E2EVE generated edits | 
| ------------------------- |
| <img src="https://user-images.githubusercontent.com/44160842/178516711-57c317e4-74fa-4e5b-8b3c-002ab3efb20e.jpeg" width="800" /> |
  
</div>

We pair this end-to-end approach with the adoption of state-of-the-art auto-regressive image modelling using transformers for learning and sampling from this distribution. In order to train a model end-to-end, we take a self-supervised approach that simulates edits by augmenting off-the-shelf images during training. This approach is shown in the Figure below.

<div align="center">
  
| The E2EVE Approach | 
| ------------------------- |
| <img src="https://user-images.githubusercontent.com/44160842/178517356-029cbaf1-fcac-4845-98f6-2e1a4b7f2d84.jpg" width="800" /> |
  
</div>

## Summary

This repository contains the code for:

- A demo using a pre-trained E2EVE model trained on LSUN Bedroom
- Example training scripts for training the E2EVE transformer are included for both:
  - <em>Block edits</em>, where the model learns to edit a square region in a source image (see paper for details)
  - <em>Random free form edits</em>, where the model learns to edit randomly drawn regions in a source image
- Pre-training the visual tokenizers (<em>i.e.</em> E<sub>1</sub>,D<sub>1</sub> and E<sub>2</sub>,D<sub>2</sub> in the Figure above)

 
## Setup

1) Clone this repository
2) ```pip install -r requirements.txt```
3) Download required meta data for the demo and training with ```./utils/download_val_meta.sh```. This includes metadata for the E2EVE validation setup

## Demo
We provide a demo for using the E2EVE model trained on LSUN Bedrooms in an IPython Notebook. To run the demo:
1) download the (i) meta data (see above), and (ii) LSUN Bedroom weights using ```./utils/download_LSUN_weights.sh```
2) follow the notebook ```demo.ipynb```. This will generate the examples shown below:

<div align="center">
  
| E2EVE generated images in demo | 
| ------------------------- |
| <img src="https://user-images.githubusercontent.com/44160842/202865026-6aeebe99-7c95-4f0a-a365-606fb13f10fb.jpg" width="800" /> |
  
</div>

## Training the Visual Generator
Example config files for training on FFHQ with <em>block edits</em> or <em>random free form edits</em> are found in ```configs/FFHQ/train_block_edit.json``` and ```configs/FFHQ/train_random_mask.json```, respectively. 

First, make sure to:
- include paths to pre-trained [visual tokenizers](#visual-tokenizers)
- download the [data](#e2eve-validation-metadata) required for E2EVE model validation

- Then, to train with <em>block edits</em>, run 

```python main.py --parameters configs/FFHQ/train_block_edit.json```

- To train with <em>random free form edits</em>, run

```python main.py --parameters configs/FFHQ/train_random_mask.json```




### Visual Tokenizers
Training the visual generator requires pre-trained visual tokenizers. 
First, make sure to include the paths to the pre-trained visual tokenizers in the config files:
- point ```model.first_stage_config.ckpt_path``` to the pretained source/masked-source image visual tokenizer (<em>i.e.</em> E<sub>1</sub>,D<sub>1</sub>) 
- point ```model.cond_stage_config.ckpt_path``` to the pretained driver image visual tokenizer (<em>i.e.</em> E<sub>2</sub>,D<sub>2</sub>)
- point ```model.cond_stage2_config.ckpt_path``` to the pretained source/masked-source image visual tokenizer (<em>i.e.</em> E<sub>1</sub>,D<sub>1</sub>) 

**Training tokenizers from scratch** - for training visual tokenizers from scratch, see [this section ](#training-the-visual-tokenizers)

**Pre-trained tokenizers** - note, for fairness in the paper, we use the same visual tokenizer as released by the [EdiBERT paper authors](https://github.com/edibert4imagemanipulation/edibert). In the paper we demonstrate the advantage of using two seperate visual tokenizers for the driver and source/masked-source images. However, competitive results can still be obtained by using the source image tokenizer for both.

### E2EVE Validation Metadata
We implement a model validation process where metrics are computed over a set of samples generated by the model (see paper for details). This requires some prepared data so that samples are computed over the same inputs each time, and so that FID is compared against the same real image features. This is included in the meta data download in the Setup section

## Training the Visual Tokenizers
Example config files for training the source/masked-source image, or driver image visual tokenizers on FFHQ are found in ```configs/FFHQ/train_VQGAN_source.json``` and ```configs/FFHQ/train_VQGAN_driver.json```, respectively. 

- To train the source/masked-source image visual tokenizer, run:

```python main.py --parameters configs/FFHQ/train_VQGAN_source.json```

- To train the driver image visual tokenizer, run:

```python main.py --parameters configs/FFHQ/train_VQGAN_driver.json```

## License and Contributing

Please refer to the [LICENSE](LICENSE.md). For contributing, see [contributing](CONTRIBUTING.md) and the [code of conduct](CODE_OF_CONDUCT.md).


## Paper
If you find this repository useful, please consider citing:
```
@InProceedings{Brown2022E2EVE,
  author       = "Andrew Brown and Cheng-Yang Fu and Omkar Parkhi and Tamara L. Berg and Andrea Vedaldi",
  title        = "End-to-End Visual Editing with a Generatively Pre-Trained Artist",
  booktitle    = "European Conference on Computer Vision (ECCV)",
  year         = "2022",
}
