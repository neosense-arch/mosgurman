<?php

namespace Mosgurman\FrontBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class CartOrderType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('count')
            ->add('weight')
            ->add('item', 'entity', array(
                'class'    => 'NS\CatalogBundle\Entity\Item',
                'property' => 'title',
            ))
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Mosgurman\FrontBundle\Entity\CartOrder'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'mosgurman_frontbundle_cartorder';
    }
}
