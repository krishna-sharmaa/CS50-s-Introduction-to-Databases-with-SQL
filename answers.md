# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

I will prefer this approach because in this approach data will be evenly distributed. Every observation has equal probability to be distributed among the boats.
I will not prefer this approach because it can be computationally expensive.

## Partitioning by Hour

I will prefer this approach because it will be less computationally expensive. You don't have to run queries for all the boats. You will run query only for those whom you want.
One reason I will not choose this approach is that data will not be evenly distributed.

## Partitioning by Hash Value

I will prefer this approach because it will evenly distribute the observations on the basis of their hash values. But, I have to run through every boat becuase there is a range of hash values and any observation can be assigned to any boat
