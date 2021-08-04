import torch

import utility
import data
import model
import loss
import os
from option import args
from trainer import Trainer

def print_network(net):
    num_params = 0
    for param in net.parameters():
        num_params += param.numel()
    print(net)
    print('Total number of parameters: %d' % num_params)


def print_setting(args):
     print('cwd:', os.getcwd())
     print('init this train:')
     print('training model:', args.model)
     print('scale:', args.scale)
     print('resume from ', args.resume)
     print('output patch size', args.patch_size)
     print('model setting: n_resblocks:', args.n_resblocks,
        'n_feats:', args.n_feats, 'block_feats:', args.block_feats)
     print('optimization setting: ', args.optimizer)
     print('total epochs:', args.epochs)
     print('lr:', args.lr, 'lr_decay at:', args.decay_type, 'decay gamma:', args.gamma)
     print('train loss:', args.loss)
     print('save_name:', args.save)
     print('data_train', args.data_train)

torch.manual_seed(args.seed)
checkpoint = utility.checkpoint(args)

if checkpoint.ok:
    print_setting(args)
    loader = data.Data(args)
    model = model.Model(args, checkpoint)
    print_network(model)
    loss = loss.Loss(args, checkpoint) if not args.test_only else None
    t = Trainer(args, loader, model, loss, checkpoint)
    while not t.terminate():
        t.train()
        t.test()

    checkpoint.done()

