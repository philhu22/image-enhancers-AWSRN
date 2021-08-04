cd ./code/src

#=================== AWSRN =================
#AWSRN x2
python main.py --model AWSRN --n_resblocks 4 --scale 2  --save AWSRNx2  --epochs 1000 --reset --patch_size 96
#AWSRN x3
python main.py --model AWSRN --n_resblocks 4 --scale 3 --save AWSRNx3  --epochs 1000 --reset --patch_size 144
#AWSRN x4
python main.py --model AWSRN --n_resblocks 4 --scale 4  --save AWSRNx4  --epochs 1000 --reset --patch_size 192
#AWSRN x8
python main.py --model AWSRN --n_resblocks 4 --scale 8  --save AWSRNx8  --epochs 1000 --reset --patch_size 384

#=================== AWSRN-M =================
#AWSRN-M x2
python main.py --model AWSRN --n_resblocks 3 --scale 2  --save AWSRN_Mx2  --epochs 1000 --reset --patch_size 96
#AWSRN-M x3
python main.py --model AWSRN --n_resblocks 3 --scale 3  --save AWSRN_Mx3  --epochs 1000 --reset --patch_size 144
#AWSRN-M x4
python main.py --model AWSRN --n_resblocks 3 --scale 4  --save AWSRN_Mx4  --epochs 1000 --reset --patch_size 192

#=================== AWSRN-S =================
#AWSRN-S x2
python main.py --model AWSRN --n_resblocks 1 --scale 2  --save AWSRN_Sx2  --epochs 1000 --reset --patch_size 96
#AWSRN-S x3
python main.py --model AWSRN --n_resblocks 1 --scale 3 --save AWSRN_Sx3_retrain  --epochs 1000  --reset --patch_size 144
#AWSRN-S x4
python main.py --model AWSRN --n_resblocks 1 --scale 4 --save AWSRN_Sx4  --epochs 1000  --reset --patch_size 192

#=================== AWSRN-SD =================
#AWSRN-SD x2
python main.py --model AWSRND --n_resblocks 1 --n_feats 16 --block_feats 128 --scale 2  --save AWSRN_SDx2  --epochs 1000 --reset --patch_size 96 
#AWSRN-SD x3
python main.py --model AWSRND --n_resblocks 1 --n_feats 16 --block_feats 128 --scale 3  --save AWSRN_SDx3  --epochs 1000 --reset --patch_size 144 
#AWSRN-SD x4
python main.py --model AWSRND --n_resblocks 1 --n_feats 16 --block_feats 128 --scale 4  --save AWSRN_SDx4  --epochs 1000 --reset --patch_size 192 
